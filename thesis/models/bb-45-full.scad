union(){
translate([2.54+1.05,.5,0])
cylinder(5,1,1,center=true,$fn=20);
translate([2.54+1.05,35.2,0])
cylinder(5,1,1,center=true,$fn=20);
translate([2.54*45+1.05,.5,0])
cylinder(5,1,1,center=true,$fn=20);
translate([2.54*45+1.05,35.2,0])
cylinder(5,1,1,center=true,$fn=20);
difference(){
translate([0,-2,0])
cube([120,40,8.43]);

for(z=[1:45]){

translate([2.54*z,2.032,-.01])
cube([2.1,13.84,6.76]);

translate([2.54*z+.1,-20.32,4])
cube([1.5,60,2.54]);

translate([2.54*z,19.685,-.01])
cube([2.1,13.84,6.76]);
}
}
}