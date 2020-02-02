/// @description Execute symbol rotation
if (!gridCalculating && !shouldFillEmpty) {
	var valueA = gameGrid[# selectorLocation0[0], selectorLocation0[1]];
	var valueB = gameGrid[# selectorLocation1[0], selectorLocation1[1]];
	gameGrid[# selectorLocation0[0], selectorLocation0[1]] = valueB;
	gameGrid[# selectorLocation1[0], selectorLocation1[1]] = valueA;
	if (gameGrid[# selectorLocation0[0], selectorLocation0[1]] > 0) {
		draw_sprite(objectTypes[? gameGrid[# selectorLocation0[0], selectorLocation0[1]]], 0, x + (selectorLocation0[0] * OBJECT_DIMENSION), y + (selectorLocation0[1] * OBJECT_DIMENSION));
	}
	if (gameGrid[# selectorLocation1[0], selectorLocation1[1]] > 0) {
		draw_sprite(objectTypes[? gameGrid[# selectorLocation1[0], selectorLocation1[1]]], 0, x + (selectorLocation1[0] * OBJECT_DIMENSION), y + (selectorLocation1[1] * OBJECT_DIMENSION));
	}
	gridCalculating = true;
}