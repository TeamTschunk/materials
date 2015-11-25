module holder() {
    difference() {
        cube([10,66,23], center = true);
        union() {
            cube([30,64,21], center = true);
            translate([0,0,2]) cube([30,44,21], center = true);
        }
    }
}

module camera_holder() {
    union(){
        translate([0,0,-18]) difference() {
            cube([39,14,11], center = true);
            union() {
                cube([37,30,9], center = true);
                translate([0,0,-2]) cube([21,30,9], center = true);
            }
        }
        
        translate([11, 0,-23.5]) cylinder(r=7,h=1, $fn=100);
        translate([-11, 0,-23.5]) cylinder(r=7,h=1, $fn=100);
    }
}

module connector() {
    hull() {
        translate([0,0,-13] ) cube([39,14,1], center = true);
        translate([0,0,-11] ) cube([10,66,1], center = true);
    }
}

union() {
    holder();
    camera_holder();
    connector();
    translate([0, 22,10.5]) cylinder(r=5,h=1, $fn=100);
    translate([0, -22,10.5]) cylinder(r=5,h=1, $fn=100);
}