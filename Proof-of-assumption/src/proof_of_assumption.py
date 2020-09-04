import networkx as nx
import numpy as np
import math
import pickle
import random
from functools import reduce
from collections import Counter
from tqdm import tqdm
from multiprocessing import Pool

from lib.network import Network
from lib.target import Target

def is_sublist(sub_l, l, bidirectional=True):
    idxes = [l.index(i) for i in sub_l if i in l]
    if len(idxes) == len(sub_l):
        is_sublist = all([x - y == 1 for x, y in zip(idxes[1:], idxes[:-1])])
        is_reversed_sublist = all([y - x == 1 for x, y in zip(idxes[1:], idxes[:-1])])
        return is_sublist or bidirectional and is_reversed_sublist
    return False


def attack(args):
    target = args[0]
    attackers = args[1]
    stats = {}
    for hop, decoy_cands in target.decoy_cands.items():
        stats[hop] = Counter()
        for attacker in attackers:
            cands = [cand for cand in decoy_cands if cand != attacker]
            for decoy in cands:
                path = network.paths[attacker][decoy]
                stats[hop]['passed'] += is_sublist(target.link, path)
                stats[hop]['total'] += 1
            stats[hop]['skipped'] += len(cands) == 0
    return stats


if __name__ == '__main__':
    H = range(1, 7)

    network = Network('./data/dataset_1000a.txt')

    isolated_nodes = [n for n, d in network.graph.degree() if d == 1]
    edges = [edge for edge in network.edges if edge[0] not in isolated_nodes and edge[1] not in isolated_nodes]

    num_targets = math.ceil(len(edges)/2)
    num_attackers = math.ceil(len(network.nodes)/2)
    targets = [Target(edge, network.graph, H)
               for edge in tqdm(random.sample(edges, num_targets))]
    attackers = random.sample(network.nodes, num_attackers)

    with Pool() as p:
        stats = p.map(attack, [(target, attackers) for target in targets])

    stats_h = {h: reduce(lambda x, y: Counter(x, **y),
                            [stat[h] for stat in stats])
                  for h in H}

    for h, stat in stats_h.items():
        print(f'Hop: {h}, Total: {stat["total"]}, Passed: {stat["passed"]}, Ratio: {stat["total"] and stat["passed"]/stat["total"]}')

    with open('stats.pkl', 'wb') as f:
        pickle.dump(stats_h, f)
