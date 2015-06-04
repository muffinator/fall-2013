#CC-BY-SA Josh Gordonson
from sim import *
from random import *
from math import *
from cmath import *
net = 'ac'
out = 'output'
nodenum=4
nodelist=range(1,nodenum+1)
print nodelist,'\n'
[rmatrix,cmatrix]=writeRandomNet(net,nodenum,['R','C'])

rboop = [[None for x in range(int(nodenum))] for x in range(int(nodenum))] 

lp=[]
lo=[]

def odelist(n,m,nodelist):
    return [str(int(x)) for x in nodelist if ((x!=int(n))&(x!=int(m)))]

for n in nodelist:
    insertProbe2(net,[str(n)],odelist(n,n,nodelist),[],'AC')
    lpt=runSim(net+'-t',out,'AC')
    lt = []
    for m in odelist(n,n,nodelist):
        m=int(m)
        insertProbe2(net,[str(n)],odelist(n,m,nodelist),[str(m)],'AC')
        try:
            lt+=[(runSim(net+'-t',out,'AC')[str(m)])]
        except:
            lt+=[None]
    lp+=[lpt]
    lo+=[lt]
subprocess.call("clear")
print("R:")
printMatrix(rmatrix)
print("L:")
#printMatrix(lmatrix)
print("C:")
printMatrix(cmatrix)
print ''
for l in lp:
    print l
print'' 
rp=[[-l['v'][n] for l in lp] for n in range(len(lp[0]['v']))]
for r in rp:
    print''
    for q in r:
        print q
print''
for l in lo:
    print l
    print ''
    for m in l:
        print m
print ''
for n in range(nodenum):
    r=range(nodenum)
    r.remove(n)
    for m in r:
        try:
            #print 'm: '+str(m)+' n: '+str(n)
            #print rp[m]/lo[n][0]
            rboop[m][n]=rp[0][m]/lo[n][0][0]
        except:
            pass
            #print None
        lo[n][0].remove(lo[n][0][0])
for n in range(nodenum):
    tmp=float("inf")
    for r in rboop[n]:
        try:
            tmp=1/(1/tmp+1/r)
            #print tmp
        except:
            pass
    try:
        if abs(tmp-rp[0][n])>1E-5:
            rboop[n][n]=1/(1/rp[0][n]-1/tmp)
    except:
        pass
print ''
printMatrix(rboop)
print ''

writeJason('resistor',rboop,1)
writeJason('given',rmatrix,3)

