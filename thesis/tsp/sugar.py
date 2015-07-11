import serial
import time
from pylab import *
ser = serial.Serial("/dev/ttyACM0")

def medicine(chan):
    ser.write(['g',(0<<chan)])
    ser.write(['m',chan])
    ser.write(['s',10])
    a = ser.readline()
    b = [((ord(a[2*x+1])<<8)+ord(a[2*x])) for x in range(len(a)/2)]
   # print(x,a[0:10])
    print(x,a[21:23],((ord(a[21])<<8)+ord(a[22]))*5.04/1024)
    plot(range(len(b)+70),b[2:-2]+74*[b[-2]],label=chan)

for x in range(8):
    medicine(x)
legend(loc="lower right")
show()
ser.close()
