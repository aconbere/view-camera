$fa = 1;
$fs = 0.04;
e = 0.01;

module frame() {
    union () {
        difference() {
            cube([184, 184, 30]);
            translate([22, 22, -e])
                cube([140, 140, 30 + 2*e]);
        }
        difference() {
            translate([22, 22, 4-e])
                cube([140, 140, 4 + e]);

            translate([32, 32, -e])
                cube([120, 120, 30 + 2*e]);
        }
    }
}

frame();
