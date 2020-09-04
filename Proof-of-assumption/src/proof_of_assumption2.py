import networkx as nx
import numpy as np
import math
import pickle
import random
from collections import Counter
from functools import reduce
from tqdm import tqdm
from multiprocessing import Pool

from lib.network import Network
from lib.target import Target
from models.models import (
    attack,
    send,
)


def run(act_func, act_args, sim_name):
    with Pool() as p:
        stats = p.map(act_func, act_args)

    max_hop = max([max(stat) for stat in stats if len(stat) > 0])

    stats_h = {h: reduce(lambda x, y: Counter(x, **y),
                         [stat[h] for stat in stats])
               for h in range(max_hop + 1)}

    total = 0
    for h, stat in stats_h.items():
        print(f'Hop: {h}, Passed: {stat["passed"]}')
        total += stat['passed']
    print(total)

    with open(f'./simulations/{sim_name}.pkl', 'wb') as f:
        pickle.dump(stats_h, f)


if __name__ == '__main__':
    H = range(1, 7)

    network = Network('./data/dataset_1000a.txt')

    isolated_nodes = [n for n, d in network.graph.degree() if d == 1]
    edges = [edge for edge in network.edges if edge[0] not in isolated_nodes and edge[1] not in isolated_nodes]

    num_targets = math.ceil(len(edges)/2)
    num_senders = math.ceil(len(network.nodes)/2)
    targets = [Target(edge, network.graph, H)
               for edge in tqdm(random.sample(edges, num_targets))]
    senders = random.sample(network.nodes, num_senders)

    run(act_func=send,
        act_args=[(network, target, senders, network.nodes) for target in targets],
        sim_name='legitimate-users')

    for hop_limit in H:
        run(act_func=attack,
            act_args=[(network, target, senders, hop_limit) for target in targets],
            sim_name=f'attackers-hop-limit{hop_limit}')
