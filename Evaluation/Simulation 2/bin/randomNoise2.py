#!/usr/bin/python
# -*- encoding: utf-8 -*-
#もともとのやつ

import numpy.random as rand

SIZE = 600

for l in range(0, 10000 + 1, 1):
  noise = rand.poisson(lam=l, size=SIZE)
  fileName = "./random_noise/lambda_%05d" % l
  outputFile = open(fileName, 'w')
  for n in noise:
    line = "%d\n" % n
    outputFile.write(line)
  outputFile.close()

