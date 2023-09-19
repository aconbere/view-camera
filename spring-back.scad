$fa = 1;
$fs = 0.04;
e = 0.01;


module panel() {
    height = 8;
    translate([0,0,height/2])
        difference() {
            cube([184, 184, height], center=true);
            cube([100, 120, height + e], center=true);
        }
}


module light_trap () {
    height = 6;
    translate([0,0,height/2])
        difference() {
            cube([172, 172, height], center=true);
            cube([132, 132, height + e], center=true);
        }
}

module spring_back(outer_dimension) {
    panel();

    translate([0, 0, 8])
        light_trap();
}

spring_back();
