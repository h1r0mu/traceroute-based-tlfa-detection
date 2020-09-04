#!/usr/bin/python
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt
import collections
import numpy as np

#auc vs bc のグラフを作成する
l=1000
aucfile = '../AUC/dataset1000_1000ms/AUC/lambda%09d.txt'% l
env = '1000_1000ms'
outputFileName = "./image/auc_vs_bc/%s_lambda%09d.eps" % (env, l)
bc = {}
for line in open('../centrality.txt', 'r'):
  para = line.split(',')
  as_number = int(para[0])
  centrality = float(para[1])
  bc[as_number] = centrality
#  for env in env_list:
  #  for l in lambdas:
    #  path = aucFile % (env, l)
auc = {}
for line in open(aucfile, 'r'):
  para = line.split(',')
  number = int(para[0])
  a = float(para[1])
  auc[number] = a
mean = []
var = []
std = []
bcs = []
aucList = collections.defaultdict(list)
for number in sorted(auc.keys()):
  aucList[0.01*float(int(bc[number]*100))].append(auc[number])
for b in sorted(aucList.keys()):
  arr = np.array(aucList[b])
  mean.append(np.average(arr))
  var.append(np.var(arr))
  std.append(np.std(arr))
  bcs.append(b)

fig = plt.figure(figsize=(16,9))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel('betweenness centrality')                  # X tick label
ax.set_ylabel('AUC')                  # Y tick label
ax.set_ylim([-0.05, 1.05])            # [min, max] value of Y tick
# [min, max] value of X tick
ax.set_xlim([-max(bcs)*0.02, max(bcs)*1.02])

plt.errorbar(x=bcs, y=mean, yerr=var, markersize=15, color='r', fmt='o', ecolor='r', elinewidth=1, capsize=10)

# set X tick scales
#plt.xticks([0, 1000, 2000, 3000, 4000], ['0', '1,000', '2,000', '3,000', '4,000'])
# set Y tick scales
#plt.yticks([0.0, 0.2, 0.4, 0.6, 0.8, 1.0], [0.0, 0.2, 0.4, 0.6, 0.8, 1.0])

# set location of legend
#    plt.legend(bbox_to_anchor=(0.5, -0.25),
#        ncol=2,             # the number of colmuns in legend (default=1)
#        loc='upper center', # location of legend
#        borderaxespad=0,
#        numpoints=1         # the number of points in legend (default=2)
#        )
# make space within figure
#plt.subplots_adjust(right=0.7)

# use tex style and generate eps by ghostscript
# bounding box adjusted!!
plt.rcParams['ps.useafm'] = True
plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['text.usetex'] = True

plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
#        #pad_inches=0.0
    )
plt.show()
plt.close()