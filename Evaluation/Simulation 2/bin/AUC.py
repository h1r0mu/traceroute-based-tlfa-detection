#!/usr/bin/python
# -*- encoding: utf-8 -*-
#thresholdの中から　AUCを算出
import sys
import Myconf

#  lambdaList = [10, 100, 1000, 10000, 100000, 1000000, 10000000]
#  lambdaList = [10000, 100000, 1000000, 10000000]
#  lambdaList = [100]
#  lambdaList = [10,100,1000, 10000,100000]
lambdaList = [100,1000,10000]
argv = sys.argv
argc = len(argv)

if argc < 3:
  print "Usage : python AUC.py dataset folder"
  sys.exit(0)

node_list = []
filename = Myconf.TOPOLOGY + argv[1]
#  for line in open(filename, 'r'):
  #  para = line.split(',')
  #  as_number = int(para[0])
  #  node_list.append(as_number)

for line in open(filename,'r'):
    if line.startswith('#'):
        continue
    para = line.split('|')
    node1 = int(para[0])
    node2 = int(para[1])
    if node1 not in node_list : node_list.append(node1)
    if node2 not in node_list : node_list.append(node2)

#従来手法
for l in lambdaList:
  auclist = {}
  #  for as_number in node_list:
  for as_number in node_list:
    path =  Myconf.USER + argv[2]+'/threshold/lambda%09d-as%05d.txt' % (l, as_number)
    data = []
    x = []
    y = []
    points = {}
    aucx = []
    aucy = []
    for line in open(path, 'r'):
      para = line.split(',')
      tp = float(para[1])
      fp = float(para[2])
      data.append((fp,tp))
      x.append(fp)
      y.append(tp)

    for i in range(len(x))[::-1]:
      points[x[i]] = y[i]

    for key in sorted(points.keys()):
      aucx.append(key)
      aucy.append(points[key])

    prev = aucx[0]
    auc = 0.0
    for i in range(1, len(aucx)):
      d = aucx[i] - prev
      prev = aucx[i]
      auc += (aucy[i] * d)
    auclist[as_number] = auc

  outputFileName = Myconf.AUC + argv[2]+"/AUC/lambda%09d.txt" % (l)
  outputFile = open(outputFileName, 'w')
  for as_number in sorted(auclist.keys()):
    auc = auclist[as_number]
    line = "%05d, %f\n" % (as_number, auc)
    outputFile.write(line)

#提案手法
for l in lambdaList:
  auclist2 = {}
  #  for as_number in node_list:
  for as_number in node_list:
    path =  Myconf.USER + argv[2]+"/threshold2/lambda%09d-as%05d.txt" % (l, as_number)
    data = []
    x = []
    y = []
    points = {}
    aucx = []
    aucy = []
    for line in open(path, 'r'):
      para = line.split(',')
      tp = float(para[1])
      fp = float(para[2])
      data.append((fp,tp))
      x.append(fp)
      y.append(tp)

    for o in range(len(x))[::-1]:
      points[x[o]] = y[o]

    for key in sorted(points.keys()):
      aucx.append(key)
      aucy.append(points[key])

    prev = aucx[0]
    auc = 0.0
    for o in range(1, len(aucx)):
      d = aucx[o] - prev
      prev = aucx[o]
      auc += (aucy[o] * d)
    auclist2[as_number] = auc

  outputFileName = Myconf.AUC + argv[2]+"/AUC2/lambda%09d.txt" % (l)
  outputFile = open(outputFileName, 'w')
  for as_number in sorted(auclist.keys()):
    auc2 = auclist2[as_number]
    line2 = "%05d, %f\n" % (as_number, auc2)
    outputFile.write(line2)
