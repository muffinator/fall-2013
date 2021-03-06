#CC-BY-SA Josh Gordonson
from sim import *
from random import *


[rmatrix]=writeRandomNet('netlist',4,['R'])
printMatrix(rmatrix)
network=runSim('netlist','output')
nodes=sorted(network.keys())
nuno = len(nodes)
twod = [[0 for x in range(int(nuno))] for x in range(int(nuno))] 
r = [[None for x in range(int(nuno))] for x in range(int(nuno))] 
#for every node in the circuit
for node in nodes:
    iterate=sorted(network.keys()) 
    iterate.remove(node)		    	#put a test voltage on that node and
    insertProbe2('netlist', [node],iterate)	#ground every other node in the circuit
    temp = runSim('netlist-t','output')		#simulate this
    twod[int(node)-1][int(node)-1]=temp		#store the results in 2d
    #print 'iterate: '+ str(iterate)
    subnode =[]
    for test in iterate:	#now 'test' all nodes that aren't 'node'
        iter2=network.keys()	
        iter2.remove(node)
        iter2.remove(test)	#and sense the voltage on 'test' 
        #print iter2
        insertProbe2('netlist', [node],iter2)	#ground all of the other nodes
        temp = runSim('netlist-t','output')
        print int(node)-1, int(test)-1, range(int(nuno))
        twod[int(node)-1][int(test)-1]=temp	#store the results in 2d
print '\n'
for node in range(nuno):
    for subnode in range(nuno): #make start pt node+1 for upper triangle
        s=0
        e=0
        c1=0
        c2=0
       # print node, subnode, str(subnode+1)
       # print twod[node][subnode]
        s=twod[node][subnode][str(subnode+1)]
        e=twod[subnode][node][str(node+1)]
        if s <> 1.0:
            c1=s/(1.0-s)
        else:
            c1=1E19
        if e <> 1.0:
            c2=e/(1.0*zp-e)
        else:
            c2=1E19
        #print 's: '+str(s)+' c1: '+str(c1)+' e: '+str(e)+' c2: '+str(c2)
        if node==subnode or c1==c2==0.0:
            pass
        else:
            i = -1*twod[node][subnode]['v']
            ir= -1*twod[subnode][node]['v']
            r[node][subnode]=(c1+c2+1)/(i*(c2+c1*c2))
            print node, subnode, r[node][subnode]-(c1+c2+1)/(ir*(c1+c2*c1))
\
print 'Given: \n'
printMatrix(rmatrix)
print '\n'
a = range(nuno)
b=[]
for node in a:
    b=[]
    b += a
    b.remove(node)
    rp=0
    for subnode in b:
        if r[node][subnode]:
            tmp = 1./float(r[node][subnode])
        else:
            tmp=0
        rp += tmp
    if rp<>0:
        irp = 1.0/rp
    req = -1.0/twod[node][node]['v']
    if req<>irp:
        rng = req*irp/(irp-req)
        if rng>0:
            r[node][node]=rng
        if rng>100:
            print rp, irp-req
print 'Calculated: \n'
printMatrix(r)

writeJason('resistor',r,1)
writeJason('given',rmatrix,3)
print 'finished!'

#
#for node in nodes:
#    iterate=network.keys()
#    iterate.remove(node)
#    insertProbe2('netlist',[node],[])
#    matrix+=[runSim('netlist-t','output')]
#    insertProbe2('netlist',[node],iterate)
#    matrix+=[runSim('netlist-t','output')]
#
#print matrix
