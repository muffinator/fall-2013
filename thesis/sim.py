#CC-BY-SA Josh Gordonson
from random import *
import subprocess

def runSim(target,results):
    output=open(results+'.txt', 'w')
    a=subprocess.call(['ngspice','-b',target+'.cir'], stdout=output) #run ngspice
    output.close()
    output=open(results+'.txt', 'r')
    a=output.read().splitlines()[7:] #get rid of the non-data output
    output.close()
    vars={}
    for node in a:
        entry=node.replace('(','').replace(')','') #formatting
        exec(entry) #assign the resulting text values to the text variables
        nodeval = entry.split('=') #make it easy to make a dictionary of the var/vals
        vars.update({nodeval[0].strip()[1:]:float(nodeval[1].strip())})
    return vars

def insertProbe(target,node):
    netlist=open(target+'.cir', 'r')
    contents=netlist.readlines()
    netlist.close()
    contents.insert(1,'V '+node+' 0 DC 1\n')
    contents.insert(-3,'print i(V)\n')
    netlist=open(target+'-t.cir', 'w')
    netlist.write("".join(contents))
    netlist.close()
    return contents

# inserts a voltage probe at [nodes] and grounds [groundNodes] in netlist 'target'
def insertProbe2(target,nodes,groundNodes):
    netlist=open(target+'.cir', 'r')
    contents=netlist.readlines()
    netlist.close()
    sources=''.join(['V '+x+' 0 DC 1\n' for x in nodes])
    grounds=''.join(['Vg'+x+' '+x+' 0 DC 0\n' for x in groundNodes])
    currents=''.join(['print i(V)\n' for x in nodes])
    contents.insert(1,sources+grounds)
    contents.insert(-3,currents)
    netlist=open(target+'-t.cir', 'w')
    netlist.write("".join(contents))
    netlist.close()
    return contents

def printMatrix(m):
    for row in m: 
        concat='' 
        for entry in row: 
            if entry==None: 
                print entry,'   ', 
            else: 
                print('{:.2e}'.format(entry)), 
        print ' '
	pass  

def genMatrix(num):
    seed()
    rmatrix=[[None for x in range(num)] for x in range(num)]
    count=0
    for r in range(num):
        for x in range(r,num):
            tmp = randint(0,1)
            if tmp==1:
                rmatrix[x][r]=rmatrix[r][x]=1
        count+=1
    for x in range(num):
        if sum(filter(None,rmatrix[x]))<1:
            return genMatrix(num)
    return rmatrix

def writeRandomNet(netlist,num,elements):
    elemlist=[]
    wname=[]
    if 'R' in elements:
        elemlist+=[genMatrix(num)]
        wname+=['R']
    if 'L' in elements:
        wname+=['L']
        elemlist+=[genMatrix(num)]
    if 'C' in elements:
        wname+=['C']
        elemlist+=[genMatrix(num)]
    netlist=open(netlist+'.cir', 'w')
    netlist.write('mynetlist\n')
    val=str(1)
    idx=0
    for elem in elemlist:
        numr=0
        for x in range(num):
            for y in range(x,num):
                if elem[x][y]:
                    elem[x][y]=int(10**triangular(0,3,1.5))*(10**(-9*idx))
                    elem[y][x]=elem[x][y]
                    val = str(elem[x][y])
                    s = x
                    e = y
                    if s==e:
                       e = -1
                    netlist.write(wname[elemlist.index(elem)]+str(numr)+' '+str(s+1)+' '+str(e+1)+' '+val+'\n')
                    numr+=1
        idx=1
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
        pass
        #return 0
    return elemlist

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
                    chewed+=[[str(n),str(m),str(network[n][m])]]
                else:
                    chewed+=[[str(n),str(len(network)),str(network[n][n])]]
    for bite in chewed:
        jason.write('   {"source":'+bite[0]+',"target":'+bite[1]+',"value":'+bite[2]+'}')
        if chewed.index(bite)<(len(chewed)-1):
            jason.write(',\n')
        else:
            jason.write('\n')
    jason.write(']\n}')
    jason.close()

