$fa = 1;
$fs = 0.04;

e = 0.01;

module mitered_edge(outer_dimension, height, width) {
    difference() {
        cube([outer_dimension, width, height]);

        // these create the mitered edges
        translate([outer_dimension-25, +25, 0])
        rotate(-45)
            cube([width + 100, width, height]);

        rotate(45)
            cube([width + 100, width, height]);
    }
}

module frame_edge(outer_dimension, height, material_width) {
    difference() {
        mitered_edge(outer_dimension, height, material_width);

        // create the dado 4mm thick by 1/2 material_width
        translate([0, material_width/2, 4])
            cube([outer_dimension, material_width, 4]);
    }
}


module frame(outer_dimension, height, material_width) {
    union() {
        frame_edge(outer_dimension, height, material_width);

        translate([outer_dimension, 0, 0])
        rotate(90)
            frame_edge(outer_dimension, height, material_width);

        translate([outer_dimension, outer_dimension, 0])
        rotate(180)
            frame_edge(outer_dimension, height, material_width);
        
        translate([0, outer_dimension, 0])
        rotate(270)
            frame_edge(outer_dimension, height, material_width);
    }
}
