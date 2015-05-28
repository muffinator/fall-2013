#CC-BY-SA Josh Gordonson
from sim import *
from random import *
net = 'rlc'
out = 'output'
nodenum=3
nodelist=range(nodenum)
print nodelist
[rmatrix,cmatrix]=writeRandomNet(net,nodenum,['R','C'])
print("R:")
printMatrix(rmatrix)
print("L:")
#printMatrix(lmatrix)
print("C:")
printMatrix(cmatrix)
print("")

lp=[]
rp=[]
for n in nodelist:
    print [str(n)]
    print [str(x) for x in nodelist if x!=int(n)]
    insertProbe2(net,[str(n+1)],[str(x+1) for x in nodelist if x!=int(n)])
    lp+=[runSim(net+'-t',out)]
print lp
[


