$fa = 1;
$fs = 0.04;
e = 0.01;

module plate() {
    union() {
        cube([140, 140, 4], center=true);

    }
}

module light_trap() {
    difference() {
        cube([120, 120, 6], center=true);
        cube([80, 80, 6 + e], center=true);
    }
}

module lens_board() {
    plate();
    translate([0, 0, 4])
        light_trap();
}

lens_board();
