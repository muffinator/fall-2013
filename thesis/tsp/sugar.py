import serial
from random import *
import time
import numpy as np
import matplotlib.pyplot as plt
from pylab import *

ser = serial.Serial("/dev/ttyACM0")

def medicine(chan,freq=1000):
    ser.write(['g',(0<<chan)])
    freq = int(freq)
    f=[freq&0xff,(freq&0xff00)>>8,(freq&0xff0000)>>16]
    # print freq, f
    ser.write(['m',chan])
    ser.flushInput()
    ser.write((['s']+f))
    a = ser.read(2000)
    b = [5*((ord(a[2*x+1])<<8)+ord(a[2*x]))/1024. for x in range(len(a)/2)]
    # b = b[2:-2]
    # t=linspace(0,1000,1000)
    # b = [100*cos(90*3.1415/1000*x)+150+10*random() for x in t]
    bx=[0]
    nmax=0
    nmin=0
    look=1
    dur = 10
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
    amp=max(abs(ft)[1:])/500
    # print amp
    # show()
    # plot(range(len(bx[1:])),bx[1:],'b',range(len(b)+7),b+7*[b[-1]],'r',label=chan)
    # show()
    # print ":".join("{:02x}".format(ord(c)) for c in a)
    return(amp)

#for x in range(8):
 #   medicine(x)
#medicine(5)
# medicine(2,900)
# medicine(4,900)
# show()
# medicine(2,5000)
# medicine(4,5000)
# show()
# medicine(2,40000)
# medicine(4,40000)
# show()
tps=50
v=[]
i=[]
z=[]
#4429 (189) 4535 (185)
w = logspace(5,2,tps)
c = [1/((s*2*3.1415)*33E-6) for s in w]
cp5 = [1/((s*2*3.1415)*33E-6*1.05) for s in w]
cm5 = [1/((s*2*3.1415)*33E-6*.95) for s in w]
r = [1500 for s in w]
avg=0
for x in w:
    v+=[medicine(2,x)]
    i+=[medicine(4,x)]
    z+=[v[-1]/i[-1]*90]
    avg+=(1./(z[-1]*2*3.1415*x*tps))
#print(medicine(2,10)/medicine(4,10)*90)
#print(medicine(2,100)/medicine(4,100)*90)
print avg
fig, ax1 = plt.subplots()

ax2 = ax1.twinx()
ax1.semilogx(w, v, 'y-', w,i, 'g-')
ax2.loglog(w, z, 'b-o', w, c, 'k-', w, cm5, 'k.-', w, cp5, 'k.-', w, r, 'k-')

ax1.set_xlabel('Frequench (Hz) data')
ax1.set_ylabel('Voltage (yellow) Current (Green)', color='g')
ax2.set_ylabel('Impedance (Ohms)', color='b')

plt.savefig("/home/muffin/Documents/fall-2013/thesis/tsp/plots/fig.png")

ser.close()
