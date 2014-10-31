import subprocess
import random
n=7
random.seed()
R1 = 100 
R2 = 100 #random.randint(1,100e3)
netlist=open('netlist.cir', 'w')
netlist.write("""mynetlist
R1 6 1 {0[R1]}
R2 1 0 {0[R2]}
R3 1 2 100 
R4 2 3 100
R5 3 0 100
R6 2 5 100
R7 5 0 100
.control
op
print v(1) v(2) v(3) v(4) v(5) v(6) 
.endc
.end
""".format(globals()))
netlist.close()

def runSim(target,results,numNodes):
    output=open(results+'.txt', 'w')
    a=subprocess.call(['ngspice','-b',target+'.cir'], stdout=output)
    output.close()
    output=open(results+'.txt', 'r')
    a=output.read().splitlines()[7:]
    output.close()
    vars={}
    for node in a:
        entry=node.replace('(','').replace(')','')
        exec(entry)
        nodeval = entry.split('=')
        vars.update({nodeval[0].strip()[1:]:float(nodeval[1].strip())})
    return vars

def insertProbe(target,node):
    netlist=open(target+'.cir', 'r')
    contents=netlist.readlines()
    netlist.close()
    contents.insert(1,'Vt'+node+' '+node+' 0 DC 1\n')
    contents.insert(-3,'print i(Vt'+node+')\n')
    netlist=open(target+'-t.cir', 'w')
    netlist.write("".join(contents))
    netlist.close()
    return contents

network=runSim('netlist','output',n)
for node in network.keys():
    insertProbe('netlist',node)
    print runSim('netlist-t','output',n+1)
