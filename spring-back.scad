$fa = 1;
$fs = 0.04;

e = 0.01;

// 4x5 Spring back

// 25mm == 1 inch
// 12mm == 1/2 inch
// 101.6mm = 4 inches
// 127mm == 5 inches

module spring_back(
    height,
    depth,
    margin,
    film_holder_height,
    film_gate_height,
    film_gate_width,
) {
    difference() {
        // frame
        cube([height, height, depth]);

        // film holder cut out
        translate([0-e, (height - film_holder_height) / 2, -e])
            cube([height - 15.5, film_holder_height, depth/4]);

        // indexing ridge
        translate([27.5, (height - film_holder_height) / 2, depth/4 - (2 * e)])
            cube([2.75, film_holder_height, 1]);
        
        // film gate hole
        translate([(height - (film_gate_width + 1)) / 2, (height - (film_gate_height + 3)) / 2, -e])
            cube([film_gate_width + 1, film_gate_height + 3, depth + (2 * e)]);
    }


}

spring_back(
    height = 184,
    depth = 12,
    margin=12,
    film_holder_height=121,
    film_gate_height=97,
    film_gate_width=121
);
