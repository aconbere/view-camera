$fa = 1;
$fs = 0.04;

e = 0.01;

module external_form(outer_dimension, inner_dimension, height) {
    difference() {
        // Main external form
        cube([outer_dimension, outer_dimension, height], center=true);

        // Inner cutout
        cube([inner_dimension, inner_dimension, height + e], center=true);
    }
}

module lens_board_back(outer_dimension, inner_dimension, height) {
    difference() {
        cube([outer_dimension + e, outer_dimension + e, height], center=true);
        cube([inner_dimension, inner_dimension, height +  e], center=true);
    }
}

module frame(outer_dimension, cutout_length) {
    lens_board_thickness = 4;
    outer_thickness = 12;
    inner_dimension = outer_dimension - (2 * outer_thickness);
    height = 30;

    union () {
        external_form(outer_dimension, inner_dimension, height);

        translate([0, 0, lens_board_thickness])
            lens_board_back(inner_dimension, cutout_length, lens_board_thickness);

    }
}

