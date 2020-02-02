/// @description Render and update the grid contents
for (var i = 0; i < GRID_SIZE; i++) {
	for (var j = 0; j < GRID_SIZE; j++) {
		if (gameGrid[# i, j] > 0) {
			draw_sprite(objectTypes[? gameGrid[# i, j]], 0, x + (i * OBJECT_DIMENSION), y + (j * OBJECT_DIMENSION));
		}
	}
}

if (isSelectorRotated) {
	draw_sprite_ext(bracket_spr, 0, x + (selectorLocation0[0] * OBJECT_DIMENSION) + OBJECT_DIMENSION, y + (selectorLocation0[1] * OBJECT_DIMENSION), 1, 1, -90, c_white, 1);
} else {
	draw_sprite(bracket_spr, 0, x + (selectorLocation0[0] * OBJECT_DIMENSION), y + (selectorLocation0[1] * OBJECT_DIMENSION));
}

if (complete) {
    draw_set_color(c_green)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    draw_text_transformed(x + 200, y + 170, "SUCCESS!", 2, 2, rot)
	rot += 2
    draw_set_color(c_white)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}