#CC-BY-SA Josh Gordonson
from sim import *
from random import *
from math import *
net = 'rlc'
out = 'output'
nodenum=6
nodelist=range(1,nodenum+1)
print nodelist
[rmatrix,cmatrix]=writeRandomNet(net,nodenum,['R','C'])
rboop = [[None for x in range(int(nodenum))] for x in range(int(nodenum))] 
lp=[]
lo=[]
def odelist(n,m,nodelist):
    return [str(int(x)) for x in nodelist if ((x!=int(n))&(x!=int(m)))]

for n in nodelist:
    insertProbe2(net,[str(n)],odelist(n,n,nodelist),[])
    lpt=runSim(net+'-t',out)
    lt = []
    for m in odelist(n,n,nodelist):
        m=int(m)
        insertProbe2(net,[str(n)],odelist(n,m,nodelist),[str(m)])
        try:
            lt+=[(runSim(net+'-t',out)[str(m)])]
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
rp=[-1/l['v'] for l in lp]
debug=0
if debug:
    for l in lp:
        print l 
    print ''
    print rp
    print ''
    for l in lo:
        print l
    print ''
for n in range(nodenum):
    r=range(nodenum)
    r.remove(n)
    for m in r:
        try:
            #print 'm: '+str(m)+' n: '+str(n)
            #print rp[m]/lo[n][0]
            rare= rp[m]/lo[n][0]
            if rare < 1e7:
                rboop[m][n]=rp[m]/lo[n][0]
            else:
                pass
        except:
            pass
            #print None
        #print lo[n]
        lo[n].remove(lo[n][0])
for n in range(nodenum):
    tmp=float("inf")
    for r in rboop[n]:
        try:
            tmp=1/(1/tmp+1/r)
            #print tmp
        except:
            pass
    try:
        if abs(tmp-rp[n])>1E-5:
            rare = 1/(1/rp[n]-1/tmp)
            if rare < 1e7:
                rboop[n][n]=1/(1/rp[n]-1/tmp)
            else:
                pass
    except:
        pass
print ''
printMatrix(rboop)
print ''

writeJason('resistor',rboop,1,1)
writeJason('given',rmatrix,3,1)

