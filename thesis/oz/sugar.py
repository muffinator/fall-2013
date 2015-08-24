import serial
from random import *
from sim import *
import time
import numpy as np
import matplotlib.pyplot as plt
from pylab import *

ser = serial.Serial("/dev/ttyACM0")

# def slope(m,w):
#     for e in range(1,len(m)):
#

def medicine(drive,chan,freq=1000,adc=0,uglist=[]):
    nog=0
    for x in uglist:
        nog+=(1<<x)
    ser.write(['g',0xff&(~((1<<chan)|(1<<drive)|nog))])
    ser.write(['w',drive+1])
    freq = int(freq)
    f=[freq&0xff,(freq&0xff00)>>8,(freq&0xff0000)>>16]
    ser.write(['m',chan])
    ser.flushInput()
    ser.write((['s']+f+[adc]))
    # adc value of 0 is for voltage and 1 for current
    a = ser.read(2000)
    b = [5*((ord(a[2*x+1])<<8)+ord(a[2*x]))/1024. for x in range(len(a)/2)]
    b = b[2:]
    ft=fft(b)
    aind=argmax(abs(ft[1:]))+1
    amp = abs(ft[aind])/500
    phase = angle(ft[aind])
    # plot(b)
    return abs(ft[aind])/500

""" making sure medicine works.... """

for x in range(20):
    nodenum=6
    n=range(nodenum)
    blist=[]
    zp=[]
    w=logspace(3,5,5)
    for x in n:
        zp+=[[100*medicine(x,x,f,0)/medicine(x,x,f,1) for f in w]]
        if any([i>5E4 for i in zp[-1]]):
            blist+=[x]
        # zp+=[[90*medicine(x,x,f,1) for f in w]]
        # show()
        # loglog(w,zp[x])
    # show()
    # print blist
    zm = [[[] for q in range(nodenum)] for e in range(nodenum)]
    rm = [[None for q in range(nodenum)] for e in range(nodenum)]
    for x in range(nodenum):
        o = range(nodenum)
        o.remove(x)
        if x in blist:
            zm[x][x]=[None]*len(w)
            for y in o:
                zm[x][y]=[None]*len(w)
            continue
        zm[x][x]=zp[x]
        for y in o:
            diff=[]
            for f in range(len(w)):
                zm[x][y]+=[zp[x][f]/medicine(y,x,w[f],0)*medicine(y,y,w[f],0,[x])]
                if f>1:
                    diff+=[log(zm[x][y][-1]/zm[x][y][-3])/log(w[f]/w[f-2])]
                if zm[x][y][-1]>5E4:
                    zm[x][y]=[None]*(len(w))
                    break
            rtemp=[]
            for n in range(len(diff)):
                if (diff[n]>-0.2)and(diff[n]<0.2):
                    rtemp+=[zm[x][y][n+1]]
            if rtemp:
                rm[x][y]=sum(rtemp)/len(rtemp)
        #     try:
        #         loglog(w,zm[x][y],label=str(x)+','+str(y))
        #     except:
        #         continue
        # try:
        #     loglog(w,zm[x][x],label=str(x)+','+str(x))
        # except:
        #     continue
    # printMatrix(zm)
    writeJason('resistor',rm,1,1)
    printMatrix(rm)
    # legend()
    # show()

# w=concatenate((logspace(2,3.9,10),logspace(4,5,10)))
# v=[]
# i=[]
# vn=[]
# rs=[]
# ls=[]
# cs=[]
# z=[]
# for x in w:
#     compv = medicine(0,0,x,0)
#     compi = medicine(0,0,x,1)
#     #compvn = medicine(n,p,x,0)
#     v+=[abs(compv)]
#     i+=[abs(compi)]
#     #vn+=[abs(compvn)/500]
#     z+=[v[-1]/i[-1]*100]
# for f in range(len(z)-1):
#     slope = (log(z[f+1])-log(z[f]))/(log(w[f+1])-log(w[f]))
#     if slope < -.8:
#         if slope > -1.2:
#             cs+=[1/(z[f]*2*3.1415*w[f])]
#             print 1/(z[f]*2*3.1415*w[f]),"F", w[f]
#     if slope < .2:
#         if slope > -.2:
#             rs+=[z[f]]
#             print z[f], "ohm", w[f]
#     if slope > .8:
#         if slope < 1.2:
#             ls+=[z[f]/(2*3.1415*w[f])]
#             print z[f]*2*3.1415*w[f],"H", w[f]
#
#
# fig, ax1 = plt.subplots()
#
# ax2 = ax1.twinx()
# ax1.semilogx(w, v, 'y-', w,i, 'g-')
#
# if(cs):
#     c = [1/(mean(cs)*2*3.1415*s) for s in w]
#     ax2.loglog(w,c,'k-')
# if(rs):
#     r = [mean(rs) for s in w]
#     ax2.loglog(w,r,'k-')
# if(ls):
#     l = [mean(ls)*2*3.1415*s for s in w]
#     ax2.loglog(w,l,'k-')
#
# ax2.loglog(w, z, 'b-o')
#
# ax1.set_xlabel('Frequench (Hz) data')
# ax1.set_ylabel('Voltage (yellow) Current (Green)', color='g')
# ax2.set_ylabel('Impedance (Ohms)', color='b')
# plt.savefig("/home/muffin/Documents/fall-2013/thesis/tsp/plots/fig.png")

ser.close()
