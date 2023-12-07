$fa = 1;
$fs = 0.04;

e = 0.01;

module film_holder() {
    union() {
        difference() {
            cube([184, 121, 10]);
            translate([12, 12, -e])
                cube([120, 97, 10 + (2* e)]);
        }
        translate([138, 0, 10 - e])
            cube([1, 121, 1]);
    }
}

film_holder();


