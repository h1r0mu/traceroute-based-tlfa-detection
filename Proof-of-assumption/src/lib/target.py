import networkx as nx
import random


class Target:
    def __init__(self, link, graph, hops):
        self.link = link
        self.node = random.choice(link)
        self.decoy_cands = self.select_decoy_cands(graph, hops)

    def select_decoy_cands(self, graph, hops):
        cands = {}
        for h in hops:
            cands_h = set(nx.bfs_tree(
                G=graph,
                source=self.node,
                depth_limit=h).nodes())
            cands_h_1 = set().union(*cands.values())
            cands[h] = cands_h.difference(cands_h_1)
            for node in self.link:
                cands[h].remove(node)
        return cands
