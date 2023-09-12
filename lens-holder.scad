use <ruler.scad>

$fa = 1;
$fs = 0.04;
e = 0.01;

module plate() {
    union() {
        cube([140, 140, 4]);

    }
}

module light_trap() {
    difference() {
        cube([120, 120, 6]);
        translate([20, 20])
            cube([80, 80, 6 + e]);
    }
}

module lens_holder() {
    plate();
    translate([10, 10, 4])
        light_trap();
}

lens_holder();
