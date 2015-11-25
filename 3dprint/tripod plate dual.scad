bottom = 42;
top = 32;
shoe_height = 8.2;

plate_thickness = 4;
plate_size = 50;

module shoe(_bottom, _top, _height) {
  translate([0,0,_height/2]) rotate([0,180,0]) hull() {
    translate([0,0,0.05]) cube(size = [_bottom, _bottom, 0.1], center = true);
    translate([0,0,_height/2]) cube(size = [_top,_top,_height], center = true);
  }
}

module screw_hole(_radius=3.25, _head_radius=8.5, _finger_radius=10.5) {
  union() {
    translate([0,0,0]) cylinder(h=1, r1=_radius+1, r2=_radius, $fn=100);
    translate([0,0,0]) cylinder(h = 20, r=_radius, $fn=100);
    translate([0,0,7]) cylinder(h = 6, r1=_head_radius, r2=_finger_radius, $fn=100);
  }
}

rotate([180,0,0]) translate([0,0,-shoe_height])  {
    difference() {
        translate([0,0,4])   shoe(bottom, top, shoe_height);
        union() {
            translate([7,7,-3]) screw_hole(3.25, 8.5, 9);
            translate([-7,-7,-3]) screw_hole(3.25, 8.5, 9);
        }
    }
}