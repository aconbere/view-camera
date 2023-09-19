$fa = 1;
$fs = 0.04;

e = 0.01;

use <frame.scad>

module inner_square(
    outer_dimension,
    inner_dimension,
    material_thickness,
    frame_material_thickness
) {
    length = outer_dimension - frame_material_thickness;

    translate([length/2, length/2, material_thickness/2])
    difference() {
        cube([length, length, material_thickness], center=true);
        cube([inner_dimension, inner_dimension, material_thickness+e], center=true);
    }
}

module frame_back(
    outer_dimension,
    lens_board_dimension_outer,
    lens_board_dimension_inner,
    height,
    frame_material_thickness,
) {
    dado_offset = frame_material_thickness / 2;
    union() {
        frame(outer_dimension, height, frame_material_thickness);

        // move the inner frame to the height of the dado
        translate([dado_offset, dado_offset, 4])
        color("blue")
            inner_square(
                outer_dimension,
                lens_board_dimension_inner,
                4,
                frame_material_thickness
            );
    }
}

frame_back(
    outer_dimension = 184,
    lens_board_dimension_outer = 140,
    lens_board_dimension_inner = 130,
    height = 30,
    frame_material_thickness = 12
);
