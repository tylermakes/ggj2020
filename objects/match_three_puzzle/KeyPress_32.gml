/// @description Execute symbol rotation
if (!gridCalculating && !shouldFillEmpty) {
	var valueA = gameGrid[# selectorLocation0[0], selectorLocation0[1]];
	var valueB = gameGrid[# selectorLocation1[0], selectorLocation1[1]];
	gameGrid[# selectorLocation0[0], selectorLocation0[1]] = valueB;
	gameGrid[# selectorLocation1[0], selectorLocation1[1]] = valueA;
	if (gameGrid[# selectorLocation0[0], selectorLocation0[1]] > 0) {
		draw_sprite(objectTypes[? gameGrid[# selectorLocation0[0], selectorLocation0[1]]], 0, ORIGIN_X + (selectorLocation0[0] * OBJECT_DIMENSION), ORIGIN_Y + (selectorLocation0[1] * OBJECT_DIMENSION));
	}
	if (gameGrid[# selectorLocation1[0], selectorLocation1[1]] > 0) {
		draw_sprite(objectTypes[? gameGrid[# selectorLocation1[0], selectorLocation1[1]]], 0, ORIGIN_X + (selectorLocation1[0] * OBJECT_DIMENSION), ORIGIN_Y + (selectorLocation1[1] * OBJECT_DIMENSION));
	}
	gridCalculating = true;
}