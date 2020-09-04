#!/usr/bin/python
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt
import matplotlib.patches as pat
import numpy as np

lmd = 5.0
x = np.arange(0.0, 1.01, 0.01)
y = 1.01 - np.exp(-lmd*x)

fig = plt.figure(figsize=(8,8))      # aspect ratio
plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel('False Positive Rate')                  # X tick label
ax.set_ylabel('True Positive Rate')                  # Y tick label
ax.set_ylim([0.0, 1.0])            # [min, max] value of Y tick
# [min, max] value of X tick
ax.set_xlim([0.0, 1.0])

plt.plot(x, y)

points = [(0, 0)] + list(zip(x, y))  + [(1, 0)]
poly = pat.Polygon(points, facecolor='cyan', edgecolor='k')
plt.gca().add_patch(poly)

# use tex style and generate eps by ghostscript
# bounding box adjusted!!
plt.rcParams['ps.useafm'] = True
plt.rcParams['pdf.use14corefonts'] = True
plt.rcParams['text.usetex'] = True

outputFileName = "./image/roc_curve.eps"
plt.savefig(outputFileName,
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
    #pad_inches=0.0
    )
plt.show()
plt.close()
