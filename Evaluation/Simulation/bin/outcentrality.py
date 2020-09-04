# -*- coding: utf-8 -*-
import networkx as nx
import graphproc as gp
import sys

argv = sys.argv
dataset = './topology/'+argv[1]
g = gp.creategraph(dataset)
gp.calcbc(g)
