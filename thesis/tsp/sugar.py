import serial
ser = serial.Serial("/dev/ttyACM0")

def medicine(chan):
    ser.write(['g',(1<<chan)])
    ser.write([chan])
    ser.write(['a'])
    a = ser.readline()
    print(x,a[21:23],((ord(a[21])<<8)+ord(a[22]))*5.04/1024)

for x in range(7):
    medicine(x)
ser.write(['g',0xfe])
ser.close()
