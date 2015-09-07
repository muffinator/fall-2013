#CC-BY-SA Josh Gordonson
from sim import *
from random import *
from math import *
from cmath import *
import numpy as np
import matplotlib.pyplot as plt
from pylab import *
net = 'ac'
out = 'output'
nodenum=3
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

print 'Flist:   ',flist
print ''
print("R:")
printMatrix(rmatrix)
print("L:")
printMatrix(lmatrix)
print("C:")
printMatrix(cmatrix)
print ''
fmax = len(flist)-1
fmin = 0
zboop = [[[] for x in range(int(nodenum))] for y in range(int(nodenum))]
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
#        try:
        if m==n:
            continue
        diff=[]
        for f in range(len(flist)):
            try:
                zboop[n][m]+=[float(1/((abs(zm[m][m][f]))*float(abs(zm[n][m][f]))))]
            except:
                zboop[n][m]+=[0]
            if f>1:
                try:
                    diff+=[log(zboop[n][m][-1]/zboop[n][m][-3]).real/log(flist[f]/flist[f-2]).real]
                except:
                    diff+=[0]
        rtemp=[]
        ctemp=[]
        ltemp=[]
        for x in range(len(diff)):
            if (diff[x]>-0.2)and(diff[x]<0.2):
                rtemp+=[zboop[n][m][x+1]]
            if (diff[x]>-1.1)and(diff[x]<-0.9):
                ctemp+=[1/(zboop[n][m][x+1]*2*3.1415*flist[x+1])]
            if (diff[x]<1.1)and(diff[x]>0.9):
                ltemp+=[zboop[n][m][x+1]/(2*3.1415*flist[x+1])]
        if rtemp:
            rboop[n][m]=sum(rtemp)/len(rtemp)
            if rboop[n][m]==0:
                rboop[n][m]=None
        if ctemp:
            cboop[n][m]=sum(ctemp)/len(ctemp)
        if ltemp:
            lboop[n][m]=sum(ltemp)/len(ltemp)
fig, ax1 = plt.subplots()

#ax2 = ax1.twinx()
ax1.semilogx(flist[1:-1], diff , 'k-o')

#ax2.loglog(flist,flist, 'b-o')
ax1.set_title('Finite Difference of Z[n]')
ax1.set_xlabel('Frequency (Hz) data')
ax1.set_ylabel('Z\'[n]')
#ax2.set_ylabel('Impedance (Ohms)', color='b')
plt.savefig("/home/muffin/Documents/fall-2013/thesis/thesis/fd5.png")
fig, ax2= plt.subplots()
ax2.loglog(flist,zboop[nodenum-2][nodenum-1])
ax2.set_ylabel('|Z[n]|')
ax2.set_xlabel('Frequency (Hz) data')
ax2.set_title('|Z[n]| vs Frequency')
plt.savefig("/home/muffin/Documents/fall-2013/thesis/thesis/fd6.png")
'-------------------------------------------------------------------------------'
print '\nrboop: --------------------------------------'
printMatrix(rboop)
print '\nlboop: --------------------------------------'
printMatrix(lboop)
print '\ncboop: --------------------------------------'
printMatrix(cboop)

