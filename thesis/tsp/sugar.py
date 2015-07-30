import serial
import time
import numpy as np
import matplotlib.pyplot as plt
from pylab import *
ser = serial.Serial("/dev/ttyACM0")

def medicine(chan,freq=1000):
    #ser.write(['g',(0<<chan)])
    freq = int(freq)
    f=[freq&0xff,(freq&0xff00)>>8,(freq&0xff0000)>>16]
    print freq, f
    ser.write(['m',chan])
    ser.flushInput()
    ser.write((['s']+f))
    a = ser.read(2000)
    b = [5*((ord(a[2*x+1])<<8)+ord(a[2*x]))/1024. for x in range(len(a)/2)]
    b = b[2:-2]
   # print(x,a[0:10])
    if (freq<1000):
        split=4
        ivl=250
    elif (freq<5000):
        split=10
        ivl=100
    else:
        split=40
        ivl=25
    amax=0
    amin=0
    for x in range(split):
        amax+=max(b[(ivl*x):ivl*(x+1)])
        amin+=min(b[(ivl*x):ivl*(x+1)])
    amax = amax/split
    amin = amin/split
    print amax-amin
    plot(range(len(b)+70),b+70*[b[-1]],label=chan)
    return(amax-amin)

#for x in range(8):
 #   medicine(x)
#medicine(5)
medicine(2,1000)
medicine(4,1000)
show()
# medicine(2,10000)
# medicine(4,10000)
# show()
# medicine(2,40000)
# medicine(4,40000)
# show()
tps=50
n=range(1,tps)
v=[]
i=[]
z=[]
#4429 (189) 4535 (185)
w = logspace(2,5,50)
c = [1/((s*2*3.1415)*.82E-6) for s in w]
r = [1500 for s in w]

# for x in w:
#     v+=[medicine(2,x)]
#     i+=[medicine(4,x)]
#     z+=[v[-1]/i[-1]*100]
# #print(medicine(2,10)/medicine(4,10)*90)
# #print(medicine(2,100)/medicine(4,100)*90)
#
# fig, ax1 = plt.subplots()
#
# ax2 = ax1.twinx()
# ax1.semilogx(w, v, 'y-', w,i, 'g-')
# ax2.loglog(w, z, 'b-o', w, c, 'k-', w, r, 'k-')
#
# ax1.set_xlabel('X data')
# ax1.set_ylabel('Y1 data', color='g')
# ax2.set_ylabel('Y2 data', color='b')
#
# plt.savefig("/home/muffin/Documents/fall-2013/thesis/tsp/plots/fig.png")

ser.close()
