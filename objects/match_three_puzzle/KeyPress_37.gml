/// @description Move selector bracket left
if (selectorLocation0[0] - 1 > -1 && !gridCalculating && !shouldFillEmpty) {
	selectorLocation0[0] = selectorLocation0[0] - 1;
	selectorLocation1[0] = selectorLocation1[0] - 1;
}
