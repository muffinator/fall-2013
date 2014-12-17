#CC-BY-SA Josh Gordonson
from sim import *
from random import *

def gen(num):
    seed()
    rmatrix=[[None for x in range(num)] for x in range(num)]
    count=0
    for r in range(num):
        for x in range(r,num):
            tmp = randint(0,1)
            if tmp==1:
                rmatrix[x][r]=rmatrix[r][x]=1
        count+=1
    return rmatrix

def write(netlist,num):
    rmatrix=gen(num)
    netlist=open(netlist, 'w')
    netlist.write('mynetlist\n')
    val=str(1)
    numr=0
    for x in range(num):
        if sum(filter(None,rmatrix[x]))<1:
            return 0
        for y in range(x,num):
            if rmatrix[x][y]:
                rmatrix[x][y]=randint(1,100)
                rmatrix[y][x]=rmatrix[x][y]
                val = str(rmatrix[x][y])
                s = x
                e = y
                if s==e:
                    e = -1
                netlist.write('R'+str(numr)+' '+str(s+1)+' '+str(e+1)+' '+val+'\n')
                numr+=1
    netlist.write(""".control
    op
    print """)
    for elem in range(num):
        netlist.write('v('+str(elem+1)+') ')
    netlist.write("""
    .endc
    .end
    """.format(globals()))
    netlist.close()
    if numr<num+1:
        return 0
    return rmatrix 

def printMatrix(m):
    for row in m:
        concat=''
        for entry in row:
            if entry==None:
                print entry,'   ',
            else:
                print('{:.2e}'.format(entry)),
        print ' '

rmatrix=0
while (rmatrix==0):
    rmatrix=write('netlist.cir',4)
    print 'failed'
printMatrix(rmatrix)
network=runSim('netlist','output')
nodes=sorted(network.keys())
nuno = len(nodes)
twod = [[0 for x in range(int(nuno))] for x in range(int(nuno))] 
r = [[None for x in range(int(nuno))] for x in range(int(nuno))] 
for node in nodes:
    iterate=sorted(network.keys())
    iterate.remove(node)
    insertProbe2('netlist', [node],iterate)
    temp = runSim('netlist-t','output')
    twod[int(node)-1][int(node)-1]=temp
    #print 'iterate: '+ str(iterate)
    subnode =[]
    for test in iterate:
        iter2=network.keys()
        iter2.remove(node)
        iter2.remove(test)
        #print iter2
        insertProbe2('netlist', [node],iter2)
        temp = runSim('netlist-t','output')
        print int(node)-1, int(test)-1, range(int(nuno))
        twod[int(node)-1][int(test)-1]=temp
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
            c2=e/(1.0-e)
        else:
            c2=1E19
        print 's: '+str(s)+' c1: '+str(c1)+' e: '+str(e)+' c2: '+str(c2)
        if node==subnode or c1==c2==0.0:
            pass
        else:
            i = -1*twod[node][subnode]['vt'+str(node+1)]
            r[node][subnode]=1/i/((c2+c1*c2)/(c2+c1+1))

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
    req = -1.0/twod[node][node]['vt'+str(node+1)]
    if req<>irp:
        rng = req*irp/(irp-req)
        if rng>0:
            r[node][node]=rng
        if rng>100:
            print rp, irp, req

printMatrix(r)

def writeJason(name,network,group):
    jason=open(name+'.json', 'w')
    jason.write("""{
        "nodes":[
    """)
    for n in range(len(network)):
        jason.write('   {"name":"'+str(n)+'","group":'+str(group)+'},\n')
    jason.write('   {"name":"g","group":'+str(group+1)+'}\n')
    jason.write("""],
        "links":[
    """)
    chewed=[]
    for n in range(len(network)):
        for m in range(n,len(network)):
            if network[n][m]:
                if n<>m:
                    chewed+=[[str(n),str(m),str(int(1./(network[n][m]))+1)]]
                else:
                    chewed+=[[str(n),str(len(network)),str(int(1./network[n][n])+1)]]
    for bite in chewed:
        jason.write('   {"source":'+bite[0]+',"target":'+bite[1]+',"value":'+bite[2]+'}')
        if chewed.index(bite)<(len(chewed)-1):
            jason.write(',\n')
        else:
            jason.write('\n')
    jason.write(']\n}')           
    jason.close()

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
