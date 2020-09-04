#!/usr/bin/python
# -*- encoding: utf-8 -*-
#各ASでのTPFPを出して，ファイルに出力
import collections
import Event
import Event2
import sys
import Myconf
from multiprocessing import Pool
#  import MyConf
#引数：dataset dir Loopcount
argv = sys.argv
argc = len(argv)

if argc < 3:
  print "Usage : python TPFP.py dataset folder"
  sys.exit(0)

#データセット，保存フォルダの指定
#作成されるテキストが膨大になるのでとりあえずデスクトップに保存する
filename = Myconf.TOPOLOGY + argv[1]
ATTACK_DIR =Myconf.USER  +argv[2]+'/attack' 
ATTACK_DIR2 =Myconf.USER  +argv[2]+'/attack2' 
LOOP_COUNT = int(argv[3])
node_list = []

#noiseの選択
#  lambdaList = {10, 100, 1000, 10000, 100000, 1000000, 10000000}
#  lambdaList = {10000, 100000, 1000000, 10000000}
#  lambdaList = {100}
#  lambdaList = {10,100,1000, 10000, 100000}
lambdaList = {100,1000,10000}
thresholdList = []
#node_liset(dataset)からノードのリストとdegreeを読み込む
#  filename = './topology/'+argv[1]
#  for line in open(filename, 'r'):
  #  if line.startswith('#'):  
    #  continue
  #  para = line.split('|')
  #  as_number = int(para[0])
  #  # degree = Linkの数
  #  degree = int(para[1])
  #  node_list.append(as_number)
#データセットの読み込み
for line in open(filename,'r'):
    if line.startswith('#'):
        continue
    para = line.split('|')
    node1 = int(para[0])
    node2 = int(para[1])
    if node1 not in node_list : node_list.append(node1)
    if node2 not in node_list : node_list.append(node2)
#  for i in range(10):
  #  f = 0.001 * float(i)
  #  thresholdList.append(f)
#  for i in range(1, 10):
  #  f = 0.01 * float(i)
  #  thresholdList.append(f)
#  for i in range(1, 20):
  #  f = 0.1 * float(i)
  #  thresholdList.append(f)
#  for i in range(1, 100):
  #  f = 0.1 + 0.001 * i
  #  thresholdList.append(f)
for i in range(200):
    f = 0.1 * float(i)
    thresholdList.append(f)
thresholdList.append(100)
thresholdList.sort()
TPList = {}
FPList = {}
TPList2 = {}
FPList2 = {}
optimalThreshold = {}

#ここのas_numberは読み込んだデータセットと同じにする必要あり(?)
def func(as_number):
#  for as_number in node_list:
  for l in lambdaList:
    FPList[as_number] = collections.defaultdict(float)
    TPList[as_number] = collections.defaultdict(float)
    FPList2[as_number] = collections.defaultdict(float)
    TPList2[as_number] = collections.defaultdict(float)
    for i in range(LOOP_COUNT):
      event = Event.Event()
      event2 = Event2.Event()
      #attackfileの読み込み
      attackFile = ATTACK_DIR + "/%05d-%04d.txt" % (as_number, i)
      attackFile2 = ATTACK_DIR2 + "/%05d-%04d.txt" % (as_number, i)
      event.loadAttack(attackFile)
      event2.loadAttack(attackFile2)
      #noisefileの読み込み
      noiseFile = Myconf.NOISE + "/lambda_%09d-%04d.txt" % (l, i)
      noiseFile2 = Myconf.NOISE_HOP + "/lambda_%09d-%04d.txt" % (l, i)
      #noiseを学習(changefinderで検出するため)
      event.loadNoiseWithLearning(noiseFile, 100)
      #  event2.loadNoiseWithLearning(noiseFile, 100)
      event.loadNoise(noiseFile)
      event2.loadNoise(noiseFile2)
      event.calcTotal()
      event2.calcTotal()
      #LearningDataを使用したかどうか
      event.calcTotalScore(useLearningData = True)
      event.calcNoiseScore(useLearningData = True)

      event2.calcTotalScore(useLearningData = True)
      event2.calcNoiseScore(useLearningData = True)

      for th in thresholdList:
        event.threshold = th
        event.detectAttack()
        event.detectNoise()
        if event.detection == True:
          TPList[as_number][th] += 1.0
        if event.missDetection == True:
          FPList[as_number][th] += 1.0

      for th2 in thresholdList:
        event2.threshold = th2
        event2.detectAttack()
        event2.detectNoise()
        if event2.detection == True:
          TPList2[as_number][th2] += 1.0
        if event2.missDetection == True:
          FPList2[as_number][th2] += 1.0

    TPForPlot = []
    FPForPlot = []
    for th in thresholdList:
      TPList[as_number][th] /= float(LOOP_COUNT)
      FPList[as_number][th] /= float(LOOP_COUNT)
      TPForPlot.append(TPList[as_number][th])
      FPForPlot.append(FPList[as_number][th])

    TPForPlot2 = []
    FPForPlot2 = []
    for th2 in thresholdList:
      TPList2[as_number][th2] /= float(LOOP_COUNT)
      FPList2[as_number][th2] /= float(LOOP_COUNT)
      TPForPlot2.append(TPList2[as_number][th2])
      FPForPlot2.append(FPList2[as_number][th2])
    #/threshold以下ににTPFPを出力
    fileName = Myconf.USER + argv[2]+"/threshold/lambda%09d-as%05d.txt" % (l, as_number)
    fileName2 = Myconf.USER + argv[2]+"/threshold2/lambda%09d-as%05d.txt" % (l, as_number)
    outputFile = open(fileName, 'w')
    for i in range(len(thresholdList)):
      th = thresholdList[i]
      tp = TPForPlot[i]
      fp = FPForPlot[i]
      line = "%f, %f, %f\n" % (th, tp, fp)
      outputFile.write(line)
    outputFile2 = open(fileName2, 'w')
    for j in range(len(thresholdList)):
      th = thresholdList[j]
      tp2 = TPForPlot2[j]
      fp2 = FPForPlot2[j]
      line2 = "%f, %f, %f\n" % (th, tp2, fp2)
      outputFile2.write(line2)

#効果あるかわからんけど一応並列処理:各ノードでTPFP出す作業
#Pool()の中がコア数
#空欄だと勝手に設定してくれるらしい
def multi(as_number):
    p = Pool(2)
    p.map(func,range(1,as_number+1))

multi(len(node_list))
multi(10)
