import serial
from random import *
import time
import numpy as np
import matplotlib.pyplot as plt
from pylab import *

ser = serial.Serial("/dev/ttyACM0")

def medicine(drive,chan,freq=1000,adc=0):
    ser.write(['g',0xff&(~((1<<chan)|(1<<drive)))])
    ser.write(['w',drive+1])
    freq = int(freq)
    f=[freq&0xff,(freq&0xff00)>>8,(freq&0xff0000)>>16]
    # print freq, f
    ser.write(['m',chan])
    ser.flushInput()
    ser.write((['s']+f+[adc]))
    # adc value of 0 is for voltage and 1 for current
    a = ser.read(2000)
    b = [5*((ord(a[2*x+1])<<8)+ord(a[2*x]))/1024. for x in range(len(a)/2)]
    b = b[2:]
    # t=linspace(0,1000,1000)
    # b = [100*cos(90*3.1415/1000*x)+150+10*random() for x in t]
    # bx=[0]
    # nmax=0
    # nmin=0
    # look=1
    # dur = 10
    ft=fft(b)
    # if (freq > 6000):
    #     dur=4
    # xlist=[]
    # h=[]
    # l=[]
    # for n in range(len(b)):
    #     bx+=[bx[n]]
    #     if look==1:
    #         if b[n] > bx[n]:
    #             bx[n+1]=b[n]
    #             nmax=n+1
    #         if nmax<n-dur:
    #             look=0
    #             h+=[bx[n]]
    #     else:
    #         if b[n] < bx[n]:
    #             bx[n+1]=b[n]
    #             nmin=n+1
    #         if nmin<n-dur:
    #             look=1
    #             l+=[bx[n]]
    # ah=(sum(h[2:])/len(h[2:]))
    # al=(sum(l[2:])/len(l[2:]))
    # print(x,a[0:10])
    # if (freq<1000):
    #     split=8
    #     ivl=125
    # elif (freq<15000):
    #     split=10
    #     ivl=100
    # else:
    #     split=40
    #     ivl=25
    # amax=0
    # amin=0
    # for x in range(split):
    #     amax+=max(b[(ivl*x):ivl*(x+1)])
    #     amin+=min(b[(ivl*x):ivl*(x+1)])
    # amax = amax/split
    # amin = amin/split
    # print amax-amin
    #plot(t,b,'k',t,bx[1:],'b')
    # plot(abs(ft)/500)
    aind=argmax(abs(ft[1:]))+1
    amp = abs(ft[aind])/500
    phase = angle(ft[aind])
    # print phase
    # plot(abs(ft[1:])/500)
    # plot(angle(ft[1:]))
    # show()
    # print amp
    # show()
    # plot(range(len(b)+7),b+7*[b[-1]],'r',label=chan)
    # show()
    # print ":".join("{:02x}".format(ord(c)) for c in a)
    return ft[aind]


# for x in range(8):
#    print medicine(x,10000,0)
#    print medicine(x,10000,1)


tps=10
zm=[]
rs=[]
ls=[]
cs=[]
w = logspace(4,5,tps)
pins = [0,1,2,3,4,5,6,7]
for p in pins:
    npins = range(8)
    npins.remove(p)
    zn=[]
    for n in npins:
        vp=[]
        ip=[]
        vn=[]
        rs=[]
        ls=[]
        cs=[]
        z=[]
        for x in w:
            compvp = medicine(p,p,x,0)
            compip = medicine(p,p,x,1)
            #compvn = medicine(n,p,x,0)
            vp+=[abs(compvp)/500]
            ip+=[abs(compip)/500]
            #vn+=[abs(compvn)/500]
            z+=[vp[-1]/ip[-1]*90]
        for f in range(len(z)-1):
            slope = (log(z[f+1])-log(z[f]))/(log(w[f+1])-log(w[f]))
            if slope < -.8:
                if slope > -1.2:
                    cs+=[1/(z[f]*2*3.1415*w[f])]
                    print 1/(z[f]*2*3.1415*w[f]),"F", w[f]
            if slope < .2:
                if slope > -.2:
                    rs+=[z[f]]
                    print z[f], "ohm", w[f]
            if slope > .8:
                if slope < 1.2:
                    ls+=[z[f]*2*3.1415*w[f]]
                    print z[f]*2*3.1415*w[f],"H", w[f]
    print ""
    zn+=[z]
    zm+=[zn]

fig, ax1 = plt.subplots()

ax2 = ax1.twinx()
ax1.semilogx(w, v, 'y-', w,i, 'g-')

if(cs):
    c = [1/(mean(cs)*2*3.1415*s) for s in w]
    ax2.loglog(w,c,'k-')
if(rs):
    r = [mean(rs) for s in w]
    ax2.loglog(w,r,'k-')
if(ls):
    l = [mean(ls)*2*3.1415*s for s in w]
    ax2.loglog(w,l,'k-')

ax2.loglog(w, z, 'b-o')

ax1.set_xlabel('Frequench (Hz) data')
ax1.set_ylabel('Voltage (yellow) Current (Green)', color='g')
ax2.set_ylabel('Impedance (Ohms)', color='b')
plt.savefig("/home/muffin/Documents/fall-2013/thesis/tsp/plots/fig.png")

ser.close()
