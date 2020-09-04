#!/usr/bin/python
# -*- encoding: utf-8 -*-
#Event.pyを弄ったもの
#hop数とかも考慮できるようにしたやつ
import numpy as np
import changefinder

class Event:
  #パラメータ:changefinder
  #r:忘却パラメータ
  #小さいと過去の影響が大きくなる
  #order:ARモデルの次数
  #どこまで過去の値をモデルへと組み込むか
  #smooth:平滑化の範囲
  #大きくすると変化を捉えられるが，大きくしすぎると変化そのものが捉えづらくなる
  def __init__(self, threshold=1.0, r=0.02, order=1, smooth=5):
    self.noise = np.empty((0,10),int)
    self.attack = np.empty((0,10),int)
    self.burst = []
    self.total = np.empty((0,10),int)
    self.learning = []
    self.noiseScore = []
    self.totalScore = []
    self.noiseDiff = []
    self.totalDiff = []
    self.noiseAlert = []
    self.totalAlert = []

    self.length = 0
    self.attackTime = -1
    self.detectionTime = -1
    self.missDetectionTime = -1
    self.threshold = threshold
    #chanfinderのパラメータ
    self.r = r
    self.order = order
    self.smooth = 5
    self.detection = False
    self.missDetection = False
  
  #ファイルからの読み込み二重配列でtargetListに格納
  def __loadTimeSeries(self, path, targetList, scale=1):
    #とりあえずここを使う  
    if scale==1:
      #ファイルから読み込んだものをnp.arrayに格納  
      #行列みたいなイメージ行：hop数，列：パケット数
      for line in open(path, 'r'):
        i = line.replace('\n','')
        i = i.split('\t')
        i = map(int,i)
        arr = np.array([i])
        np.append(targetList,arr,axis=0)
    else:
      for line in open(path, 'r'):
        i *= scale
        i = line.replace('\n','')
        i = i.split('\t')
        targetList.append(i)

  def loadNoise(self, path):
    #  self.__loadTimeSeries(path, self.noise)
    #noiseファイルの読み込み
    for line in open(path, 'r'):
      i = line.replace('\n','')
      i = i.split('\t')
      i = map(int,i)
      arr = np.array([i])
      self.noise = np.append(self.noise,arr,axis=0)

  def loadNoiseWithBurst(self, path1, path2):
    self.__loadTimeSeries(path1, self.noise)
    self.__loadTimeSeries(path2, self.burst)
    for i in range(len(self.noise)):
      self.noise[i] += self.burst[i]

  def loadNoiseWithLearning(self, path, learningLen):
    self.__loadTimeSeries(path, self.noise)
    for i in range(learningLen):
      temp = self.noise.pop(0)
      self.learning.append(temp)

  def loadNoiseWithBurstAndLearning(self, path1, path2, learningLen):
    self.__loadTimeSeries(path1, self.noise)
    self.__loadTimeSeries(path2, self.burst)
    for i in range(len(self.noise)):
      self.noise[i] += self.burst[i]
    for i in range(learningLen):
      temp = self.noise.pop(0)
      self.learning.append(temp)

  def loadAttack(self, path, scale=1):
    #  self.__loadTimeSeries(path, self.attack, 1)
    #とりあえず代用attackファイルの読み込み
    for line in open(path, 'r'):
      i = line.replace('\n','')
      i = i.split('\t')
      i = map(int,i)
      arr = np.array([i])
      self.attack = np.append(self.attack,arr,axis=0)
    for i in range(len(self.attack)):
      for j in range(10):
         c = self.attack[i,j]   
      #tracerouteが発生した時間
         if c > 0:
           self.attackTime = i
           break

  def calcTotal(self):
    #攻撃パケットとノイズの値を足し合わせる
    self.total = self.attack + self.noise
    #  for i in range(len(self.attack)):
      #  self.total[i] = self.attack[i] + self.noise[i]
      #  self.totalAlert.append(0)
      #  self.noiseAlert.append(0)

  def __calcScore(self, inputList, score, diff, useLearningData):
    cf = changefinder.ChangeFinder(r=self.r, order=self.order, smooth=self.smooth)
    #とりあえずこの場合について
    for n in range(10):
      for p in self.noise[:,n] : 
          cf.update(p)
          self.noiseAlert.append(0)
    for i in range(10):
        for j in inputList[:,i]:
             s = cf.update(j)
             score.append(s)
             self.totalAlert.append(0)
    prev = score[0]
    for s in score:
      d = s-prev
      diff.append(d)
      prev = s

  def calcNoiseScore(self, useLearningData):
    #noiseDiffは読み込んだnoisefileのnoiseの分だけ
    #attackfileとnoisefileのloadする量が同じじゃないとエラー
    self.__calcScore(self.noise, self.noiseScore, self.noiseDiff, useLearningData)
  def calcTotalScore(self, useLearningData):
    self.__calcScore(self.total, self.totalScore, self.totalDiff, useLearningData)

  #inputList : Diff , alert : totalalert
  def detect(self, inputList, alert):
    for i in range(len(inputList)):
      d = inputList[i]
      if d >= self.threshold:
        alert[i] = 1
      else:
        alert[i] = 0

  #diff > thresholdならtrue,逆ならfalse
  def detectAttack(self):
    self.detect(self.totalDiff, self.totalAlert)
    fromAttackToEnd = self.totalAlert[self.attackTime:]
    if 1 in fromAttackToEnd:
      self.detection = True
    else:
      self.detection = False

  def detectAttackWithTime(self):
    self.detect(self.totalDiff, self.totalAlert)
    fromAttackToEnd = self.totalAlert[self.attackTime:]
    if 1 in fromAttackToEnd:
      self.detection = True
      self.detectionTime = self.totalAlert.index(1)
    else:
      self.detection = False
      self.detectonTime = -1

  def detectNoise(self):
    self.detect(self.noiseDiff, self.noiseAlert)
    if 1 in self.noiseAlert:
      self.missDetection = True
    else:
      self.missDetection = False

  def detectNoiseWithTime(self):
    self.detect(self.noiseDiff, self.noiseAlert)
    if 1 in self.noiseAlert:
      self.missDetection = True
      self.missDetectionTime = self.noiseAlert.index(1)
    else:
      self.missDetection = False
      self.missDetectionTime = -1
