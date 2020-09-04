#!/usr/bin/python
# -*- encoding: utf-8 -*-
import matplotlib.pyplot as plt

lambdalist = {10,100,1000,10000}
yc=[0,0,0,0]
yp=[0,0,0,0]
count = 0
c = 0
s = 0
for l in lambdalist:
    filename = '../AUC/dataset1000_5ms/AUC/lambda%09d.txt'%(l)
    for line in open(filename,'r'):
        para = line.split(',')
        AS = int(para[0])
        auc = float(para[1])
        c += 1
        s += auc
    ave = s / c 
    yc[count] = ave
    count += 1
count = 0
print yc
c = 0
s = 0
for l in lambdalist:
    filename = '../AUC/dataset1000_5ms/AUC2/lambda%09d.txt'%(l)
    for line in open(filename,'r'):
        para = line.split(',')
        AS = int(para[0])
        auc = float(para[1])
        c += 1
        s += auc
    ave = s / c 
    yp[count] = ave
    count += 1
count = 0
print yp
fig = plt.figure(figsize=(16,9))

plt.rcParams['font.size'] = 30        # default font size
plt.rcParams['font.family'] = 'serif' # default font family
plt.rcParams['legend.fontsize'] = 18  # default font size of legend
plt.tick_params(pad=15)               # pad: Distance in points between tick and label.
ax = fig.add_subplot(1, 1, 1)         # 1 * 1 grid, and 1st subplot
ax.set_xlabel('noise')         # X tick label
ax.set_ylabel('Number of ASes (AUC > 0.9)')                  # Y tick label
ax.set_ylim([0, 1.0])            # [min, max] value of Y tick
# [min, max] value of X tick
ax.set_xlim([9.5, 40.5])

x = [10,20,30,40]
y = [yc[3],yc[2],yc[1],yc[0]]
y2 = [yp[3],yp[2],yp[1],yp[0]]
plt.plot(x,y2,'-o',ms=10,label='Proposed',color='red')
plt.plot(x,y,'--s',ms=10,label='Conventional',color='blue')
plt.legend(fontsize=30,loc='lower left')
plt.xticks([10,20,30,40], ['10', '100', '1000', '10000'])
plt.show()
        
plt.savefig('./image/ASvsnoise.eps',
    dpi=300,
    transparent=True,     
    bbox_inches='tight',  # cut blank space around figure
    #pad_inches=0.0
    )
plt.close()
