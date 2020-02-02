/// @description Update the rendering of the grid



if (delayCounter <= DELAY) {
	delayCounter = delayCounter + 1;
	//show_debug_message(@"Delay at " + string(delayCounter));
} else {
	if (shouldFillEmpty) {
		while (!ds_stack_empty(emptyCells)) {
			var currentEmptyCell = ds_stack_pop(emptyCells);
			show_debug_message(@"Current cell is " + string(currentEmptyCell[0]) + ", " + string(currentEmptyCell[1]));
			gameGrid[# currentEmptyCell[0], currentEmptyCell[1]] = irandom_range(1, 5);
		}
		gridCalculating = true;
		shouldFillEmpty = false;
		delayCounter = 0;
	} else if (gridCalculating) {
		var found = 0
		do {
			found = find_matches(GRID_SIZE, gameGrid, emptyCells);
			winsCounter += found;
			if (found >= 1 && kaijuInstance.damage > - 10) {
				kaijuInstance.damage -= 15 // heal for a job well done, also can build a small buffer
			}
		} until (found == 0);
		gridCalculating = false;
		if (!ds_stack_empty(emptyCells)) {
			shouldFillEmpty = true;
			delayCounter = 0;
		}
	} else if (!complete && winsCounter >= WIN_CONDITION) {
		kaijuInstance.heartState = 0;
		complete = true;
	}
}






