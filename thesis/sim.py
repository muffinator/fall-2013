#CC-BY-SA Josh Gordonson
import subprocess

def runSim(target,results):
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

def insertProbe2(target,nodes,groundNodes):
    netlist=open(target+'.cir', 'r')
    contents=netlist.readlines()
    netlist.close()
    sources=''.join(['Vt'+x+' '+x+' 0 DC 1\n' for x in nodes])
    grounds=''.join(['Vg'+x+' '+x+' 0 DC 0\n' for x in groundNodes])
    currents=''.join(['print i(Vt'+x+')\n' for x in nodes])
    contents.insert(1,sources+grounds)
    contents.insert(-3,currents)
    netlist=open(target+'-t.cir', 'w')
    netlist.write("".join(contents))
    netlist.close()
    return contents
