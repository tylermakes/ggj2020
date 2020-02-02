var GRID_SIZE = argument0;
var gameGrid = argument1;
var emptyCells = argument2;
var winsCounter = 0;
var matchCounter = 0;
var matchesCleared = false;

for (var i = 0; i < GRID_SIZE; i++) {
	for (var j = 0; j < GRID_SIZE; j++) {
		var searching = true;
		while(searching) {
			var nextPosition = j + 1 + matchCounter;
			if (nextPosition < GRID_SIZE && gameGrid[# i, j] != 0 && gameGrid[# i, j] == gameGrid[# i, nextPosition]) {
				matchCounter = matchCounter + 1;
			} else {
				searching = false;	
			}
		}
		if (matchCounter >= 2) {
			for (var k = 1; k <= matchCounter; k++) {
				gameGrid[# i, j + k] = 0;
				var thisCell = array_create(2);
				thisCell[0] = i;
				thisCell[1] = j + k;
				ds_stack_push(emptyCells, thisCell);
			}
			winsCounter = winsCounter + 1;
			matchesCleared = true;
		}
		searching = true;
		matchCounter = 0;
		while(searching) {
			var nextPosition = i + 1 + matchCounter;
			if (nextPosition < GRID_SIZE && gameGrid[# i, j] != 0 && gameGrid[# i, j] == gameGrid[# nextPosition, j]) {
				matchCounter = matchCounter + 1;
			} else {
				searching = false;	
			}
		}
		if (matchCounter >= 2) {
			for (var k = 1; k <= matchCounter; k++) {
				gameGrid[# i + k, j] = 0;
				var thisCell = array_create(2);
				thisCell[0] = i + k;
				thisCell[1] = j;
				ds_stack_push(emptyCells, thisCell);
			}
			winsCounter = winsCounter + 1;
			matchesCleared = true;
		}
		matchCounter = 0;
		if (matchesCleared) {
			gameGrid[# i, j] = 0;
			var thisCell = array_create(2);
			thisCell[0] = i;
			thisCell[1] = j;
			ds_stack_push(emptyCells, thisCell);
			break;
		}
	}
	if (matchesCleared) {
		break;
	}
}

return winsCounter;