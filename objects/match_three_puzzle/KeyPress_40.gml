/// @description Move selector bracket down
if (selectorLocation0[1] + 1 < GRID_SIZE && selectorLocation1[1] + 1 < GRID_SIZE && !gridCalculating && !shouldFillEmpty) {
	selectorLocation0[1] = selectorLocation0[1] + 1;
	selectorLocation1[1] = selectorLocation1[1] + 1;
}
