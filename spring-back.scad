$fa = 1;
$fs = 0.04;
e = 0.01;

module panel() {
    difference() {
        cube([184, 184, 8]);
        translate([42, 32, 0])
            cube([100, 120, 8 + e]);
    }
}


module light_trap () {
    difference() {
        cube([172, 172, 6]);
        translate([20, 20, 0])
            cube([132, 132, 6 + e]);
    }
}

module spring_back() {
    panel();

    translate([6, 6, 8])
        light_trap();
}

spring_back();
