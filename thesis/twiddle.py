from sim import *

matrix=randomNet('twiddle.cir',4)
printMatrix(matrix)
a=subprocess.call(['ngspice','-b','twiddle.cir'])

