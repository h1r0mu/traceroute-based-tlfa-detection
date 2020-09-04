#!/usr/bin/python
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt

#取り急ぎ作ったもの
#とあるASに着目してAUCの推移をプロットしたもの
fig = plt.figure(figsize=(16,9))

plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel('sending_interval[ms]')         # X tick label
ax.set_ylabel('AUC')                  # Y tick label
ax.set_ylim([-0.05, 1.05])            # [min, max] value of Y tick
# [min, max] value of X tick
ax.set_xlim([-10, 1020])

x = [5,50,500,1000]
y = [0.846,0.846,0.692,0.307]
y2 = [0.923,0.846,0.840,0.686]
plt.plot(x,y2,'-o',ms=10,label='Proposed',color='red')
plt.plot(x,y,'--s',ms=10,label='Conventional',color='blue')
plt.legend(fontsize=30,loc='lower left')
plt.xticks([5, 200, 400, 600, 800,1000], ['5', '200', '400', '600', '800','1000'])
#  plt.show()
        
plt.savefig('./image/aucvsrate.eps',
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
    #pad_inches=0.0
    )
plt.close()
