/// @description Paint color to grid
if (!gridCalculating) {
	gameGrid[# selectorLocation[0], selectorLocation[1]] = currentColor;
	gridCalculating = true;
}