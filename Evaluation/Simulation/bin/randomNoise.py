#!/usr/bin/python
# -*- encoding: utf-8 -*-
import sys
import numpy.random as rand
#  import Myconf
#引数：SIZE
argv = sys.argv
SIZE =  int(argv[1])
DIR = argv[2]
lambdaList = {10, 100, 1000, 10000, 100000, 1000000, 10000000}

for l in lambdaList:
    # rangeに注意
  for i in range(SIZE):
    # noiseをポワソン分布で出力 
    noise = rand.poisson(lam=l, size=SIZE)
    fileName = "lambda_%09d-%04d.txt" % (l, i)
    path =DIR + '/noise/' + fileName
    outputFile = open(path, 'w')
    for n in noise:
      line = "%d\n" % n
      outputFile.write(line)
    outputFile.close()
    path2 = DIR + '/noise_hop/' + fileName
    outputFile2 = open(path2,'w')
    #hop数毎に分けてnoiseを出力
    #とりあえず10個
    for n in noise:
      num = n / 10
      line = "%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\n" % (num,num,num,num,num,num,num,num,num,num)
      outputFile2.write(line)
    outputFile2.close() 
