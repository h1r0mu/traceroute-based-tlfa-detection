#!/usr/bin/python
# -*- encoding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np
import collections
import MyConf

mean = []
var = []
degrees = []
degree_as = collections.defaultdict(list)
as_auc = {}

path = MyConf.ENV_BA1000 + "/degree"
for line in open(path, 'r'):
  para = line.split(',')
  as_number = int(para[0])
  degree = int(para[1])
  degree_as[degree].append(as_number)
path = MyConf.ENV_BA1000 + "/AUC/lambda10000.txt"
for line in open(path, 'r'):
  para = line.split(',')
  as_number = int(para[0])
  auc = float(para[1])
  as_auc[as_number] = auc
for degree in sorted(degree_as.keys()):
  tmp = []
  for as_number in degree_as[degree]:
    tmp.append(as_auc[as_number])
  arr = np.array(tmp)
  mean.append(np.mean(arr))
  var.append(np.var(arr))
  degrees.append(degree)

fig = plt.figure(figsize=(16,9))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel('number of links')                  # X tick label
ax.set_ylabel('AUC')                  # Y tick label
ax.set_ylim([-0.05, 1.05])            # [min, max] value of Y tick
# [min, max] value of X tick
ax.set_xlim([-max(degrees)*0.02, max(degrees)*1.02])

plt.errorbar(x=degrees, y=mean, yerr=var, markersize=25, color="0", fmt='x', ecolor="0", elinewidth=1, capsize=10)
#    plt.plot(cdfList[1000][100], 'o--', markersize=15, color="0.75", label="Node=1,000, $\lambda=100$")
#plt.xticks(range(len(degrees)), degrees)
#plt.legend(bbox_to_anchor=(0.5, -0.25), ncol=2, loc='upper center', borderaxespad=0, numpoints=1)
#plt.subplots_adjust(right=0.7)

plt.rcParams['ps.useafm'] = True
plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['text.usetex'] = True

outputFileName = "./image/aucdegree_ba_node1000_lambda10000.eps"
plt.savefig(outputFileName, bbox_inches='tight')
plt.show()
plt.close()
