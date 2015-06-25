#CC-BY-SA Josh Gordonson
from sim import *
from random import *
from math import *
from cmath import *
net = 'ac'
out = 'output'
nodenum=2
nodelist=range(1,nodenum+1)
print nodelist,'\n'
[rmatrix,lmatrix,cmatrix]=writeRandomNet(net,nodenum,['R','L','C'])

def odelist(n,m,nodelist):
    return [str(int(x)) for x in nodelist if ((x!=int(n))&(x!=int(m)))]

zm=[]
for n in nodelist:
    zt = []
    for m in nodelist:
        m=int(m)
        insertProbe2(net,[str(n)],odelist(n,m,nodelist),[str(m)],'AC')
        try:
            if m==n:
                m='v'
            zt+=[(runSim(net+'-t',out,'AC')[str(m)])]
        except:
            zt+=[None]
    zm+=[zt]
flist=runSim(net+'-t',out,'AC')['f']
'''
for n in nodelist:
    insertProbe2(net,[str(n)],odelist(n,n,nodelist),[],'AC')
    lpt=runSim(net+'-t',out,'AC')
    lt = []
    for m in odelist(n,n,nodelist):
        m=int(m)
        insertProbe2(net,[str(n)],odelist(n,m,nodelist),[str(m)],'AC')
        try:
            lt+=[(runSim(net+'-t',out,'AC')[str(m)])]
            print lt
        except:
            lt+=[None]
    lp+=[lpt]
    lo+=[lt]
'''
subprocess.call("clear")
print("R:")
printMatrix(rmatrix)
print("L:")
printMatrix(lmatrix)
print("C:")
printMatrix(cmatrix)
print ''
print 'Flist:   ',flist
print ''
zboop = [[[None for x in range(len(flist))] for x in range(int(nodenum))] for y in range(int(nodenum))]
lboop=[[[None for x in range(len(flist))] for x in range(int(nodenum))] for y in range(int(nodenum))]
cboop=[[[None for x in range(len(flist))] for x in range(int(nodenum))] for y in range(int(nodenum))]
rboop=[[[None for x in range(len(flist))] for x in range(int(nodenum))] for y in range(int(nodenum))]
lp=[]
lo=[]
#rp=[-1/l['v'][0] for l in lp]
debug=0
if debug:
    print 'ZM: '
    printMatrix(zm)
'-------------------------------THE STUFF---------------------------------------'
for n in range(nodenum):
    for m in range(nodenum):
        for f in range(len(flist)):
            try:
                if m==n:
                    continue
                zare= -(zm[m][m][f]*zm[n][m][f])
                if abs(zare) < 1e7:
                    zboop[m][n][f]=1/(zare)
                    rboop[m][n][f]=1/zare.real
                    lboop[m][n][f]=1/(abs(zare.imag)*2*pi*flist[f])
                    cboop[m][n][f]=abs(zare.imag)/(2*pi*flist[f])
                else:
                    pass
            except:
                pass

for n in range(nodenum):
    tmp=float("inf")
    mid = len(flist)-1
    for r in rboop[n]:
        try:
            tmp=1/(1/tmp+1/r[mid])
        except:
            pass
    try:
        if abs(tmp-(1/-zm[n][n][mid].real))>1E-5:
            rare = 1/(-zm[n][n][mid].real-1/tmp)
            if abs(rare) < 1e7:
                print 'hi'
                rboop[n][n][mid]=rare
            else:
                print 'hi'
                pass
    except:
        pass
'-------------------------------------------------------------------------------'
print '\nrboop: --------------------------------------'
printMatrix(rboop)
print''
print '\ncboop: --------------------------------------'
printMatrix(cboop)
print '\nlboop: --------------------------------------'
printMatrix(lboop)
'''
    print 'rp\n'
    for r in rp:
        print complex(round(r.real,5),round(r.imag,5))
    print''
    print'lo\n'
    print lo
    print ''
    for l in lo:
        print l
        print ''
        for m in l:
            print ''
    print ''
'''
