$fa = 1;
$fs = 0.04;

e = 0.01;

use <frame-front.scad>
use <frame-back.scad>
use <lens-board.scad>
use <spring-back.scad>
use <film-holder-seat.scad>
use <film-holder.scad>

module camera () {
    frame_material_thickness = 12;

    frame_front(
        outer_dimension = 184,
        lens_board_dimension_outer = 140,
        lens_board_dimension_inner = 120,
        height = 30,
        frame_material_thickness = frame_material_thickness
    );

    translate([184,0, 300])
    rotate([0, 180, 0])
    frame_back(
        outer_dimension = 184,
        lens_board_dimension_outer = 140,
        lens_board_dimension_inner = 130,
        height = 30,
        frame_material_thickness = frame_material_thickness
    );

    translate([22, 22,0])
    lens_board(140);
}

camera();
