#!/usr/bin/python
# -*- coding: utf-8 -*-
import Network
import collections
import sys
import Myconf
#  import numpy as np
import numpy.random as random

#引数：dataset dir SIM_TIME interval bot_number Loopcount
argv = sys.argv
#使用するデータセットの指定
dataset = Myconf.TOPOLOGY + argv[1]
#出力先
attackoutputdir = Myconf.USER +argv[2]+'/attack'
attackoutputdir2 = Myconf.USER +argv[2]+'/attack2'
#SIM_TIME:s
SIM_TIME = int(argv[3])
#tracerouteの送信間隔:ms
interval = int(argv[4])
#botとdecoyの数
number = int(argv[5])
#Loopcount:大きくするともちろんだが時間もかかる
LOOP_COUNT = int(argv[6])

#ログの保存
def logToCount(logList, countList, MAX_COUNT, STEP=1000):
  timestamps = []
  for line in logList:
    time = line[2]
    timestamps.append(time)
  for i in range(MAX_COUNT):
    countList.append(0)
  for t in timestamps:
    index = int(t/STEP)
    if index >= len(countList):
      continue
    countList[index] += 1

#ログをホップ数ごとに保存
def logToCount_hop(logList,  SIM_TIME, STEP, as_number):
  timestamps = []
  dstlist = []
  l = 0
  #countListの二重配列：時間とホップ数毎のパケットの数
  countList = [[0 for p in range(20)] for j in range(SIM_TIME)]
  for line in logList:
     dst = line[1]
     time = line[2]
     timestamps.append(time)
     dstlist.append(dst)
  for t in timestamps:
    index = int(t/STEP)
    #asnumberとdstを投げてdstまでのホップ数を取得
    hop = myNet.calchop(as_number,dstlist[l])
    if index >= len(countList):
      continue
    countList[index][hop] += 1
    l += 1
  return countList    

myNet = Network.Network()
myNet.loadRelationFile(dataset)
myNet.searchTopAS()
myNet.exchangeRoutingTable()
myNet.distributeNetAddr()
#  myNet.drawGraph()

print "Routing Finished"
#  print myNet.as_list
#  print myNet.addr_to_as
#  print myNet.top_as_numbers

NODE_NUM = len(myNet.as_list)
BOT_NUM = NODE_NUM * 2
#シミュレーションを行う時間，うまい具合に設定しないとtracerouteと被らない
#むしろtracerouteが発生する時間？
#SIM_TIMEが100だったら100行分出力される
#1秒ごとにログを記録

print  NODE_NUM
print BOT_NUM

#  argv = sys.argv
#  if len(argv) != 5:
  #  print "Usage: python TPFPSimulator.py attackOutputDir noiseOutputDir burstOutputDir LoopCount\n"
  #  sys.exit(1)
#  attackOutputDir = argv[1]
#  noiseOutputDir = argv[2]
#  burstOutputDir = argv[3]
#  LOOP_COUNT = int(argv[4])

for i in range(LOOP_COUNT):
  print i
  # botとdecoyの数を指定してtracerouteを実行
  botCounts   = collections.defaultdict(int)
  decoyCounts = collections.defaultdict(int)
  botList = []
  decoyList = []
  for j in range(number):
    botNet    = random.randint(1, NODE_NUM + 1)
    decoyNet  = random.randint(1, NODE_NUM + 1)  
    botCounts[botNet] += 1
    decoyCounts[decoyNet] += 1

  for j in range(1, NODE_NUM + 1):
    botCount    = botCounts[j]
    decoyCount  = decoyCounts[j]
    botNet    = j << 16
    decoyNet  = j << 16
    for k in range(2, 2 + botCount):
      botAddr = botNet | k
      botList.append(botAddr)
    for k in range(2, 2 + decoyCount):
      decoyAddr = decoyNet | k
      decoyList.append(decoyAddr)
  for src in botList:
    #tracerouteの送信間隔  
    #  interval = 500
    startTime = 5000
    #botからdecoyへtracerouteを実行
    for dst in decoyList:
      elapsed = myNet.traceroute(src, dst, startTime)
      #  print myNet.calchop(src,dst)
      startTime += elapsed + interval
      
  # 各ASのログを保存
  for node in myNet.as_list.values():
    as_number = node.as_number
    #  print  myNet.calchop(as_number,dst)
    countList = []
    logToCount(node.tracerouteLog, countList, SIM_TIME, 1000)
    countList2 = logToCount_hop(node.tracerouteLog,  SIM_TIME, 1000, as_number)
    path = "%s/%05d-%04d.txt" % (attackoutputdir, as_number, i)
    outputFile = open(path, 'w')
    #countListを書き込み
    for c in countList:
      line = "%d\n" % c
      outputFile.write(line)
    #countListをファイルに出力
    path2 = "%s/%05d-%04d.txt" % (attackoutputdir2, as_number, i)
    outputFile2 = open(path2,'w') 
    l = 0
    for c in countList2 :
        for u in range(10):
            #ホップ数毎に分類してファイルに出力
            if (l==0 and u == 0) : line = '%d' % countList2[l][u]
            elif u == 0 : line = '\n%d' % countList2[l][u]
            else : line = '\t%d' % countList2[l][u]
            outputFile2.write(line)
        l += 1
    outputFile.close()
  myNet.clearASLog()

"""
# 各ネットワークから一定の正規確率でtracerouteを実行
for i in range(LOOP_COUNT):
  for net in myNet.as_list.values():
    noiseCounts = np.random.poisson(80, SIM_TIME)
    for j in range(0, len(noiseCounts)):
      startTime = j * 1000
      for k in range(noiseCounts[j]):
        dstNet = random.randint(1, NODE_NUM + 1)
        dstHost = random.randint(2, 254 + 1)
        dstAddr = dstNet << 16 | dstHost
        srcAddr = net.networkAddress | 0x02
        elapsed = myNet.traceroute(srcAddr, dstAddr, startTime)

  # 各ASのログを保存
  for node in myNet.as_list.values():
    as_number = node.as_number
    countList = []
    logToCount(node.tracerouteLog, countList, SIM_TIME, 1000)
    path = "%s/%05d-%04d.txt" % (noiseOutputDir, as_number, i)
    outputFile = open(path, 'w')
    for c in countList:
      line = "%d\n" % c
      outputFile.write(line)
  myNet.clearASLog()

# 各ネットワークからランダムな時間に1度バースト的なtracerouteを実行
for i in range(LOOP_COUNT):
  for net in myNet.as_list.values():
    destCounts = collections.defaultdict(int)
    for j in range(1000):
      destNet = random.randint(1, NODE_NUM + 1)
      destCounts[destNet] += 1

    srcAddr = net.networkAddress | 0x02
    destList = []
    for j in range(1, NODE_NUM + 1):
      destCount = destCounts[j]
      for k in range(destCount):
        destAddr = j << 16 | random.randint(2, 254 + 1)
        destList.append(destAddr)
    
    interval = 5
    startTime = random.randint(0, SIM_TIME * 1000)
    for dst in destList:
      elapsed = myNet.traceroute(srcAddr, dst, startTime)
      startTime += elapsed + interval

  # 各ASのログを保存
  for node in myNet.as_list.values():
    as_number = node.as_number
    countList = []
    logToCount(node.tracerouteLog, countList, SIM_TIME, 1000)
    path = "%s/%05d-%04d.txt" % (burstOutputDir, as_number, i)
    outputFile = open(path, 'w')
    for c in countList:
      line = "%d\n" % c
      outputFile.write(line)
  myNet.clearASLog()
  """
