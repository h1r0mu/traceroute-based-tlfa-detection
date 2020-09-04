#!/usr/bin/python
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt
import numpy as np

outputFileName = "./image/assum2low.eps"
bc = {}
h = [[]]
h1 = []
h2 = []
h3 = []
h4 = []
h5 = []
h6 = []
h7 = []
h8 = []
h9 = []
h10 = []
x = []
mean = []
var = []
total = 0
for line in open('./lowbc.txt', 'r'):
  para = line.split('\t')
  for i in range(1,11):
      total += int(para[i])
  #  print total
  h1.append(float(float(para[1])/total))
  h2.append(float(float(para[2])/total))
  h3.append(float(float(para[3])/total))
  h4.append(float(float(para[4])/total))
  h5.append(float(float(para[5])/total))
  h6.append(float(float(para[6])/total))
  h7.append(float(float(para[7])/total))
  h8.append(float(float(para[8])/total))
  h9.append(float(float(para[9])/total))
  h10.append(float(float(para[10])/total))
  total = 0

var.append(np.var(h1))
var.append(np.var(h2))
var.append(np.var(h3))
var.append(np.var(h4))
var.append(np.var(h5))
var.append(np.var(h6))
var.append(np.var(h7))
var.append(np.var(h8))
var.append(np.var(h9))
var.append(np.var(h10))

mean.append(np.average(h1))
mean.append(mean[0] + np.average(h2))
mean.append(mean[1] + np.average(h3))
mean.append(mean[2] + np.average(h4))
mean.append(mean[3] + np.average(h5))
mean.append(mean[4] + np.average(h6))
mean.append(mean[5] + np.average(h7))
mean.append(mean[6] + np.average(h8))
mean.append(mean[7] + np.average(h9))
mean.append(mean[8] + np.average(h10))

for i in range(1,11):
    x.append(i)

print var
print mean
print mean[1]
fig = plt.figure(figsize=(16,9))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel('The number of hop')                  # X tick label
ax.set_ylabel('Cumulative relative frequency')                  # Y tick label
ax.set_ylim([0,1.0])            # [min, max] value of Y tick
# [min, max] value of X tick
ax.set_xlim([0.9, 10.1])
plt.plot(x,mean,'-o',color='red',markersize=15)
var = np.sqrt(var)
#  plt.errorbar(x=x, y=mean, yerr=var, markersize=15, color='r', fmt='-o', ecolor='r',elinewidth=1)

#  plt.show()
plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
#        #pad_inches=0.0
    )
plt.close()
