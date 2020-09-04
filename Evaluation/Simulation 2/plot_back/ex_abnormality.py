#!/usr/bin/python
# -*- encoding: utf-8 -*-

import matplotlib.pyplot as plt
import Event
import MyConf
import numpy as np

event = Event.Event()
attackFile = "./ex_attack.txt"
noiseFile = "./ex_noise.txt"
event.loadAttack(attackFile)
event.loadNoiseWithLearning(noiseFile, 600)
event.calcTotal()
event.calcTotalScore(useLearningData = True)
total = event.total
score = event.totalScore


fig = plt.figure(figsize=(16,9))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 30  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax2 = ax.twinx()

ax.set_xlabel('$t$')                  # X tick label
ax.set_ylabel('Number of traceroute packets $x_t$') # Y tick label
ax2.set_ylabel('Abnormality $a_i$')
ax2.yaxis.set_label_coords(1.08, 0.5)
ax.set_xlim([0, 599])             # [min, max] value of X tick

# set X tick scales
plt.xticks([0, 99, 199, 299, 399, 499, 599], [1, 100, 200, 300, 400, 500, 600])

ax.plot(total, '--', markersize=25, color="b", label="Number of Packets")
ax2.plot(score, '-', markersize=25, color="r", label="Score of Abnormality");
ax2.annotate('', xy=(230, 10), xytext=(100, 30), arrowprops=dict(facecolor='red', shrink=0.05),)
ax2.annotate('Attacker Start Traceroute', xy=(0,0), xytext=(10, 30))
ax2.annotate('', xy=(300, 10), xytext=(450, 30), arrowprops=dict(facecolor='red', shrink=0.05),)
ax2.annotate('Attacker Complete Traceroute', xy=(0, 0), xytext=(300, 30))
ax2.annotate('Attack Start', xy=(450, 10), xytext=(450, 20))

#ax.plot(total, '--', markersize=25, color="0.5", label="Traceroute packets")
#ax2.plot(score, '-', markersize=25, color="0.2", label="Score of ChangeFinder");
#ax.legend(loc="upper left")
#ax2.legend(loc="center left")
h1, l1 = ax.get_legend_handles_labels()
h2, l2 = ax2.get_legend_handles_labels()
ax.legend(h1+h2, l1+l2, loc="best")

# use tex style and generate eps by ghostscript
# bounding box adjusted!!
plt.rcParams['ps.useafm'] = True
plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['text.usetex'] = True

outputFileName = "./image/AbnormalityExample.eps"
plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
   #pad_inches=0.0
    )
plt.show()
plt.close()
