# -*- coding: utf-8 -*-
import networkx as nx
import collections

#とりあえず使いそうな処理をまとめたもの
#pathがa,bのノードを通る場合にTrueを返す
def linkpath(a,b,path):
    #print path
    for i in range(0,len(path)-2):
        if path[i] == a and path[i+1] == b :
            return True
        elif path[i] == b and path[i+1] == a :
            return True

#全てのノードへの最短経路がa,bのエッジを含む割合を返す
def calcpath(g,node,a,b) :
    truecount= 0
    count = 0
#全てのノードへの最短経路を探索
    p = nx.shortest_path(g,node)
    for i in g.nodes() :
        path = p[i]
        print path
        count = count + 1 
        if linkpath(a,b,path) : truecount = truecount + 1
    return (float(truecount) / count) * 100


#filenameから読み込んでグラフの作成
#作成したグラフをりたーん
def creategraph(filename) :
    as_dict={}
    g=nx.Graph()
    for line in open(filename, 'r'):
        if line.startswith('#'):
          continue
        para = line.split('|')
        if len(para) != 3:
          continue
        node1 = int(para[0])
        node2 = int(para[1])

        if node1 not in as_dict:
          as_dict[node1] = 0
          g.add_node(node1)
        if node2 not in as_dict:
          as_dict[node2] = 0
          g.add_node(node2)
        g.add_edge(node1, node2)
    return g

#媒介中心性を求めてtxtに出力
def calcbc(g) :
  num = nx.number_of_nodes(g)  
  betweenness_centrality = nx.betweenness_centrality(G=g, k=num,  normalized=True)
  o = open('centrality.txt','w')
  for node in sorted(g.nodes()):
    sources = []
    sources.append(node)
    bc = betweenness_centrality[node]
    line = "%d,%f\n" % (node, bc)
    o.write(line)

#各ノードのlinkの数を出力
def countdegree(dataset):
    counter = collections.defaultdict(int)
    node_list = []
    for line in open(dataset,'r'):
        if line.startswith('#'):
            continue
        para = line.split('|')
        node1 = int(para[0])
        node2 = int(para[1])
        counter[node1] += 1
        counter[node2] += 1
        if node1 not in node_list : node_list.append(node1)
        if node2 not in node_list : node_list.append(node2)
    output = open('degree.txt','w')
    for node in sorted(node_list):
        line = '%d,%d\n' % (node,counter[node])
        output.write(line)

