import serial
from random import *
from sim import *
import time
import numpy as np
import matplotlib.pyplot as plt
from pylab import *

ser = serial.Serial("/dev/ttyACM0")

def medicine(drive,chan,freq=1000,adc=0):
    ser.write(['g',0x00])
    #ser.write(['g',0xff&(~((1<<chan)|(1<<drive)))])
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
    ft=fft(b)
    aind=argmax(abs(ft[1:]))+1
    amp = abs(ft[aind])/500
    phase = angle(ft[aind])
    # print phase
    # plot(abs(ft[1:])/500)
    # plot(angle(ft[1:]))
    # show()
    # print amp
    # show()
    plot(range(len(b)+7),b+7*[b[-1]],'r',label=chan)
    # print ":".join("{:02x}".format(ord(c)) for c in a)
    return abs(ft[aind])/500

# print medicine(2,5,100000,0)
# print medicine(2,5,100000,1)
zp=[]
n=3
# w=logspace(2,5,2)
w=[1000]
for x in range(n):
    zp+=[[90*medicine(x,x,f,0) for f in w]]
    #zp+=[[90*medicine(x,x,f,1) for f in w]]
    show()
    # loglog(w,zp[x])
show()

# zm = [[None for q in range(n)] for e in range(n)]
# print zm
# for x in range(n):
#     o = range(n)
#     o.remove(x)
#     zm[x][x]=zp[x]
#     for y in o:
#         zm[x][y]=[zp[x][f]/medicine(y,x,w[f],0)*500 for f in range(len(w))]
#     try:
#         loglog(w,zm[x][x],label=str(x)+','+str(x))
#     except:
#         continue
# printMatrix(zm)
# legend()
# show()

"""
v=[]
i=[]
vn=[]
rs=[]
ls=[]
cs=[]
z=[]
for x in w:
    compv = medicine(1,1,x,0)
    compi = medicine(1,1,x,1)
    #compvn = medicine(n,p,x,0)
    v+=[abs(compv)/500]
    i+=[abs(compi)/500]
    #vn+=[abs(compvn)/500]
    z+=[v[-1]/i[-1]*90]
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


fig, ax1 = plt.subplots()

ax2 = ax1.twinx()
ax1.semilogx(w, vp, 'y-', w,ip, 'g-')

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
"""
ser.close()
