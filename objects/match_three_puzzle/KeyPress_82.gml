/// @description Rotate the selector
if (!gridCalculating && !shouldFillEmpty) {
	if (isSelectorRotated) {
		if (selectorLocation0[0] + 1 >= GRID_SIZE) {
			// Rotate horizontal near edge
			selectorLocation0[0] = selectorLocation0[0] - 1;
			selectorLocation1[1] = selectorLocation1[1] - 1;
		} else {
			// Rotate horizontal not near edge
			selectorLocation1[0] = selectorLocation1[0] + 1;
			selectorLocation1[1] = selectorLocation1[1] - 1;	
		}
	} else {
		if (selectorLocation1[1] + 1 >= GRID_SIZE) {
			// Rotate vertical near edge
			selectorLocation0[1] = selectorLocation0[1] - 1;
			selectorLocation1[0] = selectorLocation1[0] - 1;
		} else {
			// Rotate vertical not near edge
			selectorLocation1[0] = selectorLocation1[0] - 1;
			selectorLocation1[1] = selectorLocation1[1] + 1;	
		}
	}
	isSelectorRotated = !isSelectorRotated;
}

