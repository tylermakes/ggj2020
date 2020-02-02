/// @description Draw the initial nodes and update the paths
var bracketColor = c_white;

for (var i = 0; i < GRID_SIZE; i++) {
	for (var j = 0; j < GRID_SIZE; j++) {
		if (gameGrid[# i, j] == "R") {
			draw_set_color(c_red);
		}
		if (gameGrid[# i, j] == "B") {
			draw_set_color(c_blue);
		}
		if (gameGrid[# i, j] == "G") {
			draw_set_color(c_green);
		}
		if (gameGrid[# i, j] != 0) {
			draw_rectangle(x + (i * OBJECT_DIMENSION), y + (j * OBJECT_DIMENSION), x + ((i + 1) * OBJECT_DIMENSION), y + ((j + 1) * OBJECT_DIMENSION), false);	
		}
	}
}

if (colors[currentColor] == "R") {
	bracketColor = c_red;
}
if (colors[currentColor] == "B") {
	bracketColor = c_blue;
}
if (colors[currentColor] == "G") {
	bracketColor = c_green;
}
draw_sprite_ext(square_bracket, 0, x + (selectorLocation[0] * OBJECT_DIMENSION), y + (selectorLocation[1] * OBJECT_DIMENSION), 1, 1, 0, bracketColor, 1);
