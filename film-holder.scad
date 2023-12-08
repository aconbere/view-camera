$fa = 1;
$fs = 0.04;

e = 0.01;

/* _________________________
 * |          B=11                       
 * |   _________________
 * |   |                | ^
 * |   |                | ^
 * | A |   121x98       | ^
 * |   |                | ^
 * |   |________________| ^
 * _____________________
 *
 * A = 15.5mm
 * ^ = 141mm
 */

module film_holder(
    holder_height,
    holder_width,
    film_gate_height,
    film_gate_width
) {
    union() {
        difference() {
            // holder body
            cube([holder_width, holder_height, 12]);

            // film gate
            translate([15.5, 11, -e])
                cube([film_gate_width, film_gate_height, 5 + (2* e)]);
        }
        // indexing ridge
        translate([138.5, 0, -1])
            cube([2.5, holder_height, 1]);
    }
}

film_holder(
    holder_height=120.5,
    holder_width=184,
    film_gate_height=98.5,
    film_gate_width=120.5
);


