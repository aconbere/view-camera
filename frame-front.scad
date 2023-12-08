$fa = 1;
$fs = 0.04;

e = 0.01;

module frame_front(
    height,
    depth,
    margin,
    hole_radius,
    lens_board_depth,
    baffle_cut_depth,
) {
    difference() {
        // outer frame
        cube([height, height, depth]);

        // cut for lens board
        translate([margin, margin, -e])
            cube([height - (2 * margin), height- (2 * margin), lens_board_depth + e]);

        // cut out for rear baffles attachment
        translate([margin, margin, depth-baffle_cut_depth+e])
            cube([height - (2 * margin), height- (2 * margin), baffle_cut_depth + e]);

        // cut out for lens
        translate([height/2, height/2, 0])
            cylinder(h=depth + e, r=hole_radius);
    }
}

frame_front(
    height = 184,
    depth = 12,
    margin=12,
    hole_radius=70,
    lens_board_depth=1.5,
    baffle_cut_depth=6
);
