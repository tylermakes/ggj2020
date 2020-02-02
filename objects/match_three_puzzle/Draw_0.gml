/// @description Render and update the grid contents
for (var i = 0; i < GRID_SIZE; i++) {
	for (var j = 0; j < GRID_SIZE; j++) {
		if (gameGrid[# i, j] > 0) {
			draw_sprite(objectTypes[? gameGrid[# i, j]], 0, ORIGIN_X + (i * OBJECT_DIMENSION), ORIGIN_Y + (j * OBJECT_DIMENSION));
		}
	}
}

if (isSelectorRotated) {
	draw_sprite_ext(bracket_spr, 0, ORIGIN_X + (selectorLocation0[0] * OBJECT_DIMENSION) + OBJECT_DIMENSION, ORIGIN_Y + (selectorLocation0[1] * OBJECT_DIMENSION), 1, 1, -90, c_white, 1);
} else {
	draw_sprite(bracket_spr, 0, ORIGIN_X + (selectorLocation0[0] * OBJECT_DIMENSION), ORIGIN_Y + (selectorLocation0[1] * OBJECT_DIMENSION));
}