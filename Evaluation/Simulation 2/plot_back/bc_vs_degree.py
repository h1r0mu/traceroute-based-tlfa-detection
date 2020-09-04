#!/usr/bin/python
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt
import MyConf

filename = MyConf.ENV_CAIDA_X100 + '/centrality'
degree = []
betweenness_centrality = []
for line in open(filename, 'r'):
  para = line.split(',')
  as_number = int(para[0])
  d = int(para[1])
  dc = float(para[2])
  bc = float(para[3])
  degree.append(d)
  betweenness_centrality.append(bc)

fig = plt.figure(figsize=(12,9))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel('degree')                  # X tick label
ax.set_ylabel('betweenness centrality')                  # Y tick label
ax.set_ylim([-max(betweenness_centrality)*0.02, max(betweenness_centrality)*1.02])            # [min, max] value of Y tick
# [min, max] value of X tick
ax.set_xlim([-max(degree)*0.02, max(degree)*1.02])

plt.scatter(degree, betweenness_centrality, marker='o')

# set X tick scales
plt.xticks([0, 1000, 2000, 3000, 4000], ['0', '1,000', '2,000', '3,000', '4,000'])
# set Y tick scales
#plt.yticks([0.0, 0.2, 0.4, 0.6, 0.8, 1.0], [0.0, 0.2, 0.4, 0.6, 0.8, 1.0])

plt.rcParams['ps.useafm'] = True
plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['text.usetex'] = True

outputFileName = "./image/bc_vs_degree.eps"
plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
   #pad_inches=0.0
    )
#plt.show()
plt.close()
