#!/usr/bin/python
# -*- encoding: utf-8 -*-
#thresholdの中からもっとも良いもの？を算出して出力
import sys
import math
import MyConf

#  lambdaList = [10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000]
#  lambdaList = [10000, 100000, 1000000, 10000000]
lambdaList = [1000000]

argv = sys.argv
argc = len(argv)

if argc < 2:
  print "Usage : python bestThreshold.py env_dir"
  sys.exit(0)

ENV_DIR = MyConf.ENV + argv[1]

node_list = []
filename = ENV_DIR + '/node_list'
for line in open(filename, 'r'):
  para = line.split(',')
  as_number = int(para[0])
  node_list.append(as_number)

for l in lambdaList:
  threshold = {}
  tp_list = {}
  fp_list = {}
  for as_number in node_list:
    path = ENV_DIR + "/threshold/lambda%09d-as%05d.txt" % (l, as_number)
    min_distance = 2.0
    best_th = -1
    best_tp = -1
    best_fp = -1
    for line in open(path, 'r'):
      para = line.split(',')
      th = float(para[0])
      tp = float(para[1])
      fp = float(para[2])
      d = math.sqrt( ((1.0-tp)**2 + (0.0-fp)**2) )
      if d < min_distance:
        min_distance = d
        best_th = th
        best_tp = tp
        best_fp = fp

    threshold[as_number] = best_th
    tp_list[as_number] = best_tp
    fp_list[as_number] = best_fp
  outputFileName = ENV_DIR + "/bestThreshold/lambda%09d.txt" % (l)
  outputFile = open(outputFileName, 'w')
  for as_number in sorted(threshold.keys()):
    th = threshold[as_number]
    tp = tp_list[as_number]
    fp = fp_list[as_number]
    line = "%05d, %f, %f, %f\n" % (as_number, th, tp, fp)
    outputFile.write(line)
  outputFile.close()
