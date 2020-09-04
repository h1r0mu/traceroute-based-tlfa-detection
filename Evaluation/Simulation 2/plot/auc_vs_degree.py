#!/usr/bin/python
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt
import collections
import numpy as np
import MyConf

aucFile = '%s/AUC/lambda%09d.txt'
degreeFile = '%s/node_list'
env_list = {
#    MyConf.ENV_BA100,
#    MyConf.ENV_BA1000,
    MyConf.ENV_WAXMAN100,
#    MyConf.ENV_WAXMAN1000,
#    MyConf.ENV_CAIDA
#    MyConf.ENV_CAIDA_SHIFT
#    MyConf.ENV_CAIDA_X10
#    MyConf.ENV_CAIDA_X100
#    MyConf.ENV_CAIDA_ORIGINAL
#    MyConf.ENV_CAIDA_DETAIL
#    MyConf.ENV_CAIDA_DETAIL_X10
#    MyConf.ENV_CAIDA_DETAIL_X100
    }
#lambdas = {100, 1000, 10000, 100000, 1000000, 10000000, 100000000}
#lambdas = {10000, 100000, 1000000, 10000000}
#lambdas = {10000}
lambdas = {1000000}

aucList = {}

for env in env_list:
  aucList[env] = {}
  degreeList = {}
  path = degreeFile % (env)
  for line in open(path, 'r'):
    para = line.split(',')
    number = int(para[0])
    degree = int(para[1])
    degreeList[number] = degree
  for l in lambdas:
    path = aucFile % (env, l)
    aucList[env][l] = collections.defaultdict(list)
    mean = []
    var = []
    std = []
    degrees = []
    for line in open(path, 'r'):
      para = line.split(',')
      number = int(para[0])
      auc = float(para[1])
      degree = degreeList[number] / 100
      degree *= 100
      aucList[env][l][degree].append(auc)
    for degree in sorted(aucList[env][l].keys()):
      arr = np.array(aucList[env][l][degree]) 
      mean.append(np.average(arr))
      var.append(np.var(arr))
      std.append(np.std(arr))
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

    plt.errorbar(x=degrees, y=mean, yerr=var, markersize=15, color="r", fmt='o', ecolor="r", elinewidth=1, capsize=10)

# set X tick scales
    plt.xticks([0, 1000, 2000, 3000, 4000], ['0', '1,000', '2,000', '3,000', '4,000'])
# set Y tick scales
    plt.yticks([0.0, 0.2, 0.4, 0.6, 0.8, 1.0], [0.0, 0.2, 0.4, 0.6, 0.8, 1.0])

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
    
    topology = None
    if (env == MyConf.ENV_BA100):
      topology = MyConf.BA100
    elif (env == MyConf.ENV_BA1000):
      topology = MyConf.BA1000
    elif (env == MyConf.ENV_WAXMAN100):
      topology = MyConf.WAXMAN100
    elif (env == MyConf.ENV_WAXMAN1000):
      topology = MyConf.WAXMAN1000
    elif (env == MyConf.ENV_CAIDA):
      topology = MyConf.CAIDA
    elif (env == MyConf.ENV_CAIDA_X10):
      topology = MyConf.CAIDA_X10
    elif (env == MyConf.ENV_CAIDA_X100):
      topology = MyConf.CAIDA_X100
    elif (env == MyConf.ENV_CAIDA_SHIFT):
      topology = MyConf.CAIDA_SHIFT
    elif (env == MyConf.ENV_CAIDA_ORIGINAL):
      topology = MyConf.CAIDA_ORIGINAL
    elif (env == MyConf.ENV_CAIDA_DETAIL):
      topology = MyConf.CAIDA_DETAIL
    elif (env == MyConf.ENV_CAIDA_DETAIL_X10):
      topology = MyConf.CAIDA_DETAIL_X10
    elif (env == MyConf.ENV_CAIDA_DETAIL_X100):
      topology = MyConf.CAIDA_DETAIL_X100
    outputFileName = "./image/auc_vs_degree/%s_lambda%09d.eps" % (topology, l)
    plt.savefig(outputFileName,
        dpi=300,
        transparent=True,     
        bbox_inches='tight',  # cut blank space around figure
        #pad_inches=0.0
        )
    plt.close()
