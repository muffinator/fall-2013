import serial
import time
import numpy as np
import matplotlib.pyplot as plt
from pylab import *
ser = serial.Serial("/dev/ttyACM0")

def medicine(chan,freq=1000):
    #ser.write(['g',(0<<chan)])
    freq = int(freq)
    f=freq#[freq&0xff,(freq&0xff00)>>8,(freq&0xff0000)>>16]
    print freq, f
    ser.write(['m',chan])
    ser.flushInput()
    ser.write((['s']+[f]))
    time.sleep(1)
    #a = ser.read(2000)
    #b = [5*((ord(a[2*x+1])<<8)+ord(a[2*x]))/1024. for x in range(len(a)/2)]
    #b = b[2:-2]
    #plot(range(len(b)+70),b+70*[b[-1]],label=chan)
    #return(max(b)-min(b))

#for x in range(8):
 #   medicine(x)
#medicine(5)

tps=50
n=range(1,tps)
v=[]
i=[]
z=[]
#4429 (189) 4535 (185)
w = linspace(180,200,120)
c = [1/((s*2*3.1415)*.82E-6) for s in w]
r = [1500 for s in w]
for x in w:
    v+=[medicine(2,x)]
#print(medicine(2,10)/medicine(4,10)*90)
#print(medicine(2,100)/medicine(4,100)*90)

ser.close()
