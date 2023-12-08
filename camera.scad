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
    lens_board_depth=1.5;

    translate([(160/2) + 12, (160/2) + 12, -20])
        lens_board(160, lens_board_depth);

    frame_front(
        height = 184,
        depth = 12,
        margin=12,
        hole_radius=70,
        lens_board_depth=lens_board_depth,
        baffle_cut_depth=6
    );

    translate([184, 0, 40])
    rotate([0, 180, 0])
    color("green")
        frame_back(
            height = 184,
            depth = 12,
            margin=12,
            baffle_cut_depth=12
        );


    translate([184, 0, 80])
    rotate([0, 180, 0])
    color("blue")
        spring_back(
            height = 184,
            depth = 12,
            margin=12,
            film_holder_height=120.5 + 0.5,
            film_gate_height=98.5,
            film_gate_width=120.5 + 0.5
        );

    translate([12, 30, 110])
    color("red")
        film_holder(
            holder_height=120.5,
            holder_width=184,
            film_gate_height=98.5,
            film_gate_width=120.5
        );
}

camera();
