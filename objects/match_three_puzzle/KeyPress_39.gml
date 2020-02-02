/// @description Move selector bracket right
if (selectorLocation1[0] + 1 < GRID_SIZE && !gridCalculating && !shouldFillEmpty) {
	selectorLocation0[0] = selectorLocation0[0] + 1;
	selectorLocation1[0] = selectorLocation1[0] + 1;
}
