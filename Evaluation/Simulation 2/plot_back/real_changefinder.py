#!/usr/bin/python
# -*- encoding: utf-8 -*-

import matplotlib.pyplot as plt
import Event
import MyConf

event = Event.Event()
attackFile = MyConf.ATTACK_FILE + "/caida_x10/00373-0000.txt"
noiseFile = MyConf.RANDOM_NOISE + "lambda_000000010-0000.txt"
event.loadAttack(attackFile)
event.loadNoiseWithLearning(noiseFile, 300)
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

ax.set_xlabel('$i$')                  # X tick label
ax.set_ylabel('Number of traceroute packets $c_i$') # Y tick label
ax2.set_ylabel('Score of ChangeFinder $s_i$')
ax2.yaxis.set_label_coords(1.08, 0.5)
ax.set_xlim([0, 299])             # [min, max] value of X tick

# set X tick scales
plt.xticks([0, 49, 99, 149, 199, 249, 299], [1, 50, 100, 150, 200, 250, 300])

ax.plot(total, '--', markersize=25, color="b", label="Traceroute packets")
ax2.plot(score, '-', markersize=25, color="r", label="Score of ChangeFinder");

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

outputFileName = "./image/RealChangeFinderExample.eps"
plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
   #pad_inches=0.0
    )
plt.show()
plt.close()
