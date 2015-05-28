from sim import *

matrix=writeRandomNet('twiddle.cir',4)
printMatrix(matrix)
a=subprocess.call(['ngspice','-b','twiddle.cir'])

