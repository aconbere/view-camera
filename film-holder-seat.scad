$fa = 1;
$fs = 0.04;

e = 0.01;

module film_holder_seat(
    external_width,
    external_depth,
    external_height,
    film_holder_width,
    film_holder_depth,
    film_holder_height
) {
    rabbet_width = film_holder_width;
    rabbet_depth = film_holder_depth + 10;
    rabbet_height = 4;

    difference() {
        // main outer dimension of the holder seat
        cube([external_width, external_depth, 20]);

        // cut away the slot that the film holder will rest in
        translate([-e, (external_depth - film_holder_depth) / 2, -e])
            cube([film_holder_width, film_holder_depth, external_height + e]);

        // cut away a rabbet around the film holder for springs
        translate([-e, (external_depth - rabbet_depth) / 2, film_holder_height])
            cube([rabbet_width, rabbet_depth, 20]);
    }
}

film_holder_seat(
    external_width = 170,
    external_depth = 170,
    external_height = 40,
    film_holder_width = 160,
    film_holder_depth = 140,
    film_holder_height = 10
);
