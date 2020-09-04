from collections import (
    defaultdict,
    Counter,
)
from models.utils.mapping import is_sublist
import random
import warnings


def attack(args):
    network = args[0]
    target = args[1]
    attackers = args[2]
    hop_limit = args[3] if len(args) >= 4 else 9999
    decoy_cands = [(hop, cand)
                   for hop, cands in target.decoy_cands.items() if hop <= hop_limit
                   for cand in cands if cand not in attackers]
    stats = defaultdict(Counter)
    if len(decoy_cands) == 0:
        warnings.warn('no cands')
        return stats
    for attacker in attackers:
        hop, decoy = random.choice(decoy_cands)
        path = network.paths[attacker][decoy]
        stats[hop]['passed'] += is_sublist(target.link, path)
    return stats


def send(args):
    network = args[0]
    target = args[1]
    users = args[2]
    nodes = args[3]
    dests = random.sample(nodes, len(users))
    stats = defaultdict(Counter)
    for dest, user in zip(dests, users):
        path = network.paths[user][dest]
        if is_sublist(target.link, path):
            hop = len(path) - max([path.index(e) for e in target.link]) - 1
            stats[hop]['passed'] += 1
    return stats
