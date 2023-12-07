$fa = 1;
$fs = 0.04;
e = 0.01;

module plate(outer_dimension) {
    cube([outer_dimension, outer_dimension, 4], center=true);
}

module light_trap() {
    difference() {
        cube([120, 120, 6], center=true);
        cube([80, 80, 6 + e], center=true);
    }
}

module lens_board(
    outer_dimension
) {
    translate([outer_dimension/2, outer_dimension/2, 0])
    union() {
        plate(outer_dimension);
        translate([0, 0, 4])
            light_trap();
    }
}

lens_board(140);
