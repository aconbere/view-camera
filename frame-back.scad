$fa = 1;
$fs = 0.04;

e = 0.01;

// 25mm == 1 inch
// 12mm = 1/2 inch

module frame_back(
    height,
    depth,
    margin,
    baffle_cut_depth,
) {
    difference() {
        // outer frame
        cube([height, height, depth]);

        // cut out for front baffles attachment
        translate([margin, margin, depth-baffle_cut_depth+e])
            cube([height - (2 * margin), height - (2 * margin), baffle_cut_depth + e]);

        // Cut out for light
        translate([2 * margin, 2 * margin, -e])
            cube([height - (4 * margin), height - (4 * margin), depth + e]);
    }
}

frame_back(
    height = 184,
    depth = 12,
    margin=12,
    baffle_cut_depth=12
);
