$fa = 1;
$fs = 0.04;
e = 0.01;

module lens_board(height, depth) {
    cube([height, height, depth], center=true);
}


lens_board(160, 1.5);
