import networkx as nx


class Network:
    def __init__(self, dataset):
        self.graph = nx.Graph()
        edges = self._read_edges(dataset)
        self.graph.add_edges_from(edges)
        self.edges = list(self.graph.edges())
        self.nodes = list(self.graph.nodes())
        self.paths = dict(nx.all_pairs_shortest_path(self.graph))

    def _read_edges(self, dataset):
        with open(dataset, 'r') as f:
            return [tuple(map(int, l.split('|')[:-1])) for l in f.readlines()[2:]]
