import subprocess
import random
n=7
random.seed()
R1 = 100 
R2 = 100 #random.randint(1,100e3)
netlist=open('netlist.cir', 'w')
netlist.write("""mynetlist
V1 6 0 DC 1
R1 6 1 {0[R1]}
R2 1 0 {0[R2]}
R3 1 2 100 
R4 2 3 100
R5 3 0 100
R6 2 5 100
R7 5 0 100
.control
op
print v(6) i(V1) v(1) v(2) v(3) v(4) v(5)
.endc
.end
""".format(globals()))
netlist.close()
output=open('output.txt', 'w')
a=subprocess.call(['ngspice','-b','netlist.cir'], stdout=output)
output.close()
output=open('output.txt', 'r')
a=output.read()
output.close()
print a
b=a.splitlines()[-n+1:]
print b
vars=[]
for node in b:
	entry=node.replace('(','').replace(')','')
	exec(entry)
	vars+=[entry.split('=')[0]]
print vars


