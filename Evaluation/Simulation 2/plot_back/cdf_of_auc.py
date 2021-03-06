#!/usr/bin/python
# -*- encoding: utf-8 -*-

import matplotlib.pyplot as plt
import MyConf

inputFile = "%s/AUC/lambda%05d.txt"
env_list = {
    MyConf.ENV_BA100,
    MyConf.ENV_BA1000,
    MyConf.ENV_WAXMAN100,
    MyConf.ENV_WAXMAN1000
    }
lambdas = {10, 100, 1000, 10000}

aucList = {}
cdfList = {}

for env in env_list:
  aucList[env] = {}
  cdfList[env] = {}
  node = None
  if env == MyConf.ENV_BA100 or env == MyConf.ENV_WAXMAN100:
    node = 100
  else:
    node = 1000
  for l in lambdas:
    path = inputFile % (env, l)
    aucList[env][l] = []
    cdfList[env][l] = []
    for line in open(path, 'r'):
      para = line.split(',')
      aucList[env][l].append(float(para[1]))
    aucList[env][l].sort()
    for i in range(0, 10):
      f = i * 0.1
      for j in range(len(aucList[env][l])):
        if (f <+ aucList[env][l][j]):
          cdfList[env][l].append(float(j)/float(node))
          break
    cdfList[env][l].append(1.0)

# save cdf of ba
fig = plt.figure(figsize=(16,9))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel(r'AUC')                  # X tick label
ax.set_ylabel(r'CDF')                  # Y tick label
ax.set_ylim([-0.05, 1.05])            # [min, max] value of Y tick
ax.set_xlim([-0.3, 10.3])             # [min, max] value of X tick

plt.plot(cdfList[MyConf.ENV_BA100][100], 'o-', markersize=15, color="0.75", label="$N=100$, $\lambda=100$")
plt.plot(cdfList[MyConf.ENV_BA100][1000], 'v-', markersize=15, color="0.5", label="$N=100$, $\lambda=1,000$")
plt.plot(cdfList[MyConf.ENV_BA100][10000], 'x-', markersize=15, color="0.25", label="$N=100$, $\lambda=10,000$")
plt.plot(cdfList[MyConf.ENV_BA1000][100], 'o--', markersize=15, color="0.75", label="$N=1,000$, $\lambda=100$")
plt.plot(cdfList[MyConf.ENV_BA1000][1000], 'v--', markersize=15, color="0.5", label="$N=1,000$, $\lambda=1,000$")
plt.plot(cdfList[MyConf.ENV_BA1000][10000], 'x--', markersize=15, color="0.25", label="$N=1,000$, $\lambda=10,000$")

plt.xticks([0, 2, 4, 6, 8, 10], [0.0, 0.2, 0.4, 0.6, 0.8, 1.0])

# set location of legend
plt.legend(bbox_to_anchor=(0.5, -0.25),
    ncol=2,             # the number of colmuns in legend (default=1)
    loc='upper center', # location of legend
    borderaxespad=0,
    numpoints=1         # the number of points in legend (default=2)
    )

# use tex style and generate eps by ghostscript
# bounding box adjusted!!
plt.rcParams['ps.useafm'] = True
plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['text.usetex'] = True

outputFileName = "./image/cdf_of_auc_ba.eps"
plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
    #pad_inches=0.0
    )
plt.close()

# save cdf of waxman
fig = plt.figure(figsize=(16,9))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel(r'AUC')                  # X tick label
ax.set_ylabel(r'CDF')                  # Y tick label
ax.set_ylim([-0.05, 1.05])            # [min, max] value of Y tick
ax.set_xlim([-0.3, 10.3])             # [min, max] value of X tick

plt.plot(cdfList[MyConf.ENV_WAXMAN100][100], 'o-', markersize=15, color="0.75", label="$N=100$, $\lambda=100$")
plt.plot(cdfList[MyConf.ENV_WAXMAN100][1000], 'v-', markersize=15, color="0.5", label="$N=100$, $\lambda=1,000$")
plt.plot(cdfList[MyConf.ENV_WAXMAN100][10000], 'x-', markersize=15, color="0.25", label="$N=100$, $\lambda=10,000$")
plt.plot(cdfList[MyConf.ENV_WAXMAN1000][100], 'o--', markersize=15, color="0.75", label="$N=1,000$, $\lambda=100$")
plt.plot(cdfList[MyConf.ENV_WAXMAN1000][1000], 'v--', markersize=15, color="0.5", label="$N=1,000$, $\lambda=1,000$")
plt.plot(cdfList[MyConf.ENV_WAXMAN1000][10000], 'x--', markersize=15, color="0.25", label="$N=1,000$, $\lambda=10,000$")

plt.xticks([0, 2, 4, 6, 8, 10], [0.0, 0.2, 0.4, 0.6, 0.8, 1.0])

# set location of legend
plt.legend(bbox_to_anchor=(0.5, -0.25),
    ncol=2,             # the number of colmuns in legend (default=1)
    loc='upper center', # location of legend
    borderaxespad=0,
    numpoints=1         # the number of points in legend (default=2)
    )

# use tex style and generate eps by ghostscript
# bounding box adjusted!!
plt.rcParams['ps.useafm'] = True
plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['text.usetex'] = True

outputFileName = "./image/cdf_of_auc_waxman.eps"
plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
    #pad_inches=0.0
    )
plt.close()
