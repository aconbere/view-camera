$fa = 1;
$fs = 0.04;

e = 0.01;

// 4x5 Spring back

// 25mm == 1 inch
// 12mm == 1/2 inch
// 6mm == 1/4 inch
// 101.6mm = 4 inches
// 127mm == 5 inches

module ground_glass_tab_neg(
    depth
) {
    cube([20, 5, depth*3/4]);
}

module film_gate_hole(
    film_gate_height,
    film_gate_width,
    tab_height,
    tab_width,
    depth
) {
    height = film_gate_height+2;
    width = film_gate_width+2;

    difference () {
        cube([height, width, depth + (2* e)]);

        translate([height/2-10, 0, 0])
            cube([tab_height, tab_width, depth*3/4]);

        translate([(height/2)-10, width-5, 0])
            cube([tab_height, tab_width, depth*3/4]);

        translate([height-5, (width/2)-10, 0])
            cube([tab_width, tab_height, depth*3/4]);

        translate([0, (width/2)-10, 0])
            cube([tab_width, tab_height, depth*3/4]);
    }
}

module ground_glass(
    height,
    width,
    depth,
    film_gate_height,
    film_gate_width,
) {
    translate([width, 0,  0])
    rotate([0,0,90])
    difference() {
        // film holder cut out
        cube([height, width, depth]);

        // film gate hole
        translate([(height - film_gate_height)/2, (width - film_gate_width)/2, -e])
            film_gate_hole(film_gate_height, film_gate_width, 20, 5, depth);
    }


}

ground_glass(
    height = 121,
    width = 184-15.5,
    depth = 12,
    film_gate_height=99,
    film_gate_width=121
);

