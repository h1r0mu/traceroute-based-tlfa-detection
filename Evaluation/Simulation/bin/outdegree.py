# -*- coding: utf-8 -*-
import graphproc as gp
import sys

argv = sys.argv
dataset = './topology/'+argv[1]
g = gp.countdegree(dataset)
