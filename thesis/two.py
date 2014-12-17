from sim import *

netlist=open('netlist.cir', 'w')
#netlist.write("""mynetlist
#R1 6 1 {0[R1]}
#R2 1 0 {0[R2]}
#R3 1 2 100 
#R4 2 3 100
#R5 3 0 100
#R6 2 5 100
#R7 5 0 100
#.control
#op
#print v(1) v(2) v(3) v(4) v(5) v(6) 
#.endc
#.end
#""".format(globals()))
netlist.write("""mynetlist
R1 0 1 300
R2 1 2 200
R3 2 0 1MEG
.control
op
print v(1) v(2)
.endc
.end
""".format(globals()))
netlist.close()

network=runSim('netlist','output')
matrix=[]
nodes=network.keys()
for node in nodes:
    iterate=network.keys()
    iterate.remove(node)
#    insertProbe('netlist',str(node))
    insertProbe2('netlist',[node],[])
    matrix+=[runSim('netlist-t','output')]
    insertProbe2('netlist',[node],iterate)
    matrix+=[runSim('netlist-t','output')]

print matrix
print 'R10||R12:        '+str(matrix[1]['1']/(-1*matrix[1]['vt1']))
print 'R20||R12:        '+str(matrix[3]['2']/(-1*matrix[3]['vt2']))
print 'R10||(R12+R20):  '+str(matrix[0]['1']/(-1*matrix[0]['vt1']))
print 'R20||(R12+R10):  '+str(matrix[2]['2']/(-1*matrix[2]['vt2']))
print 'R10/R12:         '+str(matrix[2]['1']/(matrix[2]['2']-matrix[2]['1']))
print 'R20/R12:         '+str(matrix[0]['2']/(matrix[0]['1']-matrix[0]['2']))
print 'R12:             '+str(matrix[1]['1']*matrix[2]['2']/(matrix[1]['vt1']*-1*matrix[2]['1']))
print 'R12:             '+str(matrix[3]['2']*matrix[0]['1']/(matrix[3]['vt2']*-1*matrix[0]['2']))
r12=matrix[1]['1']*matrix[2]['2']/(matrix[1]['vt1']*-1*matrix[2]['1'])
print 'R10:             '+str(r12*matrix[2]['1']/(matrix[2]['2']-matrix[2]['1']))
print 'R20:             '+str(r12*matrix[0]['2']/(matrix[0]['1']-matrix[0]['2']))
