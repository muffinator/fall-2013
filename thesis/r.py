#CC-BY-SA Josh Gordonson
from sim import *
from random import *
from math import *
net = 'rlc'
out = 'output'
nodenum=3
nodelist=range(1,nodenum+1)
print nodelist
[rmatrix]=writeRandomNet(net,nodenum,['R'])
rboop = [[None for x in range(int(nodenum))] for x in range(int(nodenum))] 
lp=[]
lo=[]
def odelist(n,m,nodelist):
    return [str(int(x)) for x in nodelist if ((x!=int(n))&(x!=int(m)))]

rm=[]
for n in nodelist:
    rt = []
    for m in nodelist:
        m=int(m)
        insertProbe2(net,[str(n)],odelist(n,m,nodelist),[str(m)])
        try:
            if m==n:
                m='v'
            rt+=[(runSim(net+'-t',out)[str(m)])]
        except:
            rt+=[None]
    rm+=[rt]
subprocess.call("clear")
print("R:")
printMatrix(rmatrix)

print ''
rn=[-1/rm[n-1][n-1] for n in nodelist]
debug=0
if debug:
    print ''
    for l in no:
        print l 
    print ''
    print rp
    print rn
    print ''
    for l in lo:
        print l
    print ''
for n in range(nodenum):
    for m in range(nodenum):
        try:
            if m==n:
                continue
            rare= -(rm[m][m]*rm[n][m])
            if rare < 1e7:
                rboop[m][n]=1/rare
            else:
                pass
        except:
            pass

for n in range(nodenum):
    tmp=float("inf")
    for r in rboop[n]:
        try:
            tmp=1/(1/tmp+1/r)
        except:
            pass
    try:
        if abs(tmp-(1/-rm[n][n]))>1E-5:
            rare = 1/(-rm[n][n]-1/tmp)
            if rare < 1e7:
                rboop[n][n]=rare
            else:
                pass
    except:
        pass
print ''
printMatrix(rboop)
print ''
error=[]
for n in range(nodenum):
    te = []
    for m in range(nodenum):
        try:
            te+=[abs(rmatrix[n][m]-rboop[n][m])]
        except:
            te+=[None]
    error+=[te]
          
printMatrix(error)
writeJason('resistor',rboop,1)
writeJason('given',rmatrix,3)

