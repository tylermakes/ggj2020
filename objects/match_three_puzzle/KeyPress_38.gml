/// @description Move selector bracket up
if (selectorLocation0[1] - 1 > -1 && selectorLocation1[1] - 1 > -1 && !gridCalculating && !shouldFillEmpty) {
	selectorLocation0[1] = selectorLocation0[1] - 1;
	selectorLocation1[1] = selectorLocation1[1] - 1;
}
