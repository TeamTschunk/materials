module holder() {
    difference() {
        cube([10,66,25], center = true);
        union() {
            translate([0,0,1]) cube([30,64,21], center = true);
            translate([0,0,4]) cube([30,44,21], center = true);
            translate([0,0,-6]) cube([12,10,10], center = true);
        }
    }
}

module camera_holder() {
    union(){
        translate([0,0,-22]) difference() {
            translate([0,0,0]) cube([14,39,15], center = true);
            union() {
                translate([0,0,-1]) cube([30,37,11], center = true);
                //translate([0,0,-2]) cube([21,20,9], center = true);
                translate([0,0,1]) cube([11,11,10], center = true);
                translate([9.5,0,5]) cube([10,11,10], center = true);
                translate([-9.5,0,5]) cube([10,11,10], center = true);
            }
        }

    }
}


union() {
    holder();
    translate([2, 0, 0]) camera_holder();
    translate([0, 22,11.5]) cylinder(r=5,h=1, $fn=100);
    translate([0, -22,11.5]) cylinder(r=5,h=1, $fn=100);
}