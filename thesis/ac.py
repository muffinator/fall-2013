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
fmax = len(flist)-1
fmin = 0
zboop = [[[None for x in range(len(flist))] for x in range(int(nodenum))] for y in range(int(nodenum))]
lboop=[[None for x in range(int(nodenum))] for y in range(int(nodenum))]
cboop=[[None for x in range(int(nodenum))] for y in range(int(nodenum))]
rboop=[[None for x in range(int(nodenum))] for y in range(int(nodenum))]
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
        try:
            if m==n:
                continue
            zare = -(zm[m][m][fmax]*zm[n][m][fmax])
            zsea = -(zm[m][m][fmax]*zm[n][m][fmax])
            zell = -(zm[m][m][fmin]*zm[n][m][fmin])
            if 1/abs(zare.real) < 1e7:
                rboop[m][n] = 1/zare.real
            for f in range(len(flist)):
                zazz= -(zm[m][m][f]*zm[n][m][f])
                if 1/abs(zazz) < 1e7:
                    zboop[m][n][f] = 1/zazz
            lboop[m][n] = 1/(abs(zell.imag)*2*pi*flist[fmin])
            cboop[m][n] = abs(zsea.imag)/(2*pi*flist[fmax])
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
        if abs(tmp-(1/-zm[n][n][fmax].real))>1E-5:
            rare = 1/(-zm[n][n][fmax].real-1/tmp)
            if abs(rare.real) < 1e7:
                rboop[n][n]=rare
            else:
                pass
    except:
        pass
'-------------------------------------------------------------------------------'
print '\nrboop: --------------------------------------'
printMatrix(rboop)
print '\nlboop: --------------------------------------'
printMatrix(lboop)
print '\ncboop: --------------------------------------'
printMatrix(cboop)

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
