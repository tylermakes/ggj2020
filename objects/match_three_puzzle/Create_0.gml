/// @description Creator for the match three puzzle

GRID_SIZE = 5;
MAX_ITEM_TYPES = 5;
OBJECT_DIMENSION = 80;
DELAY = 60;
WIN_CONDITION = 3;

rot = 0;
complete = false;
winsCounter = 0;
delayCounter = DELAY;
gridCalculating = false;
isSelectorRotated = false;
shouldFillEmpty = false;
gameGrid = ds_grid_create(GRID_SIZE, GRID_SIZE);
emptyCells = ds_stack_create();
selectorLocation0 = array_create(2);
selectorLocation1 = array_create(2);

selectorLocation0[0] = 0;
selectorLocation0[1] = 0;
selectorLocation1[0] = 1;
selectorLocation1[1] = 0;

objectTypes = ds_map_create();
objectTypes[? 1] = helicopter_spr;
objectTypes[? 2] = meat_spr;
objectTypes[? 3] = pear_spr;
objectTypes[? 4] = tank_spr;
objectTypes[? 5] = building_spr;

for (var i = 0; i < GRID_SIZE; i++) {
	for (var j = 0; j < GRID_SIZE; j++) {
		var previousValue = -1;
		var aboveValue = -1;
		if (j - 1 > -1) {
			var previousValue = gameGrid[# i, j - 1];
		}
		if (i - 1 > -1) {
			var aboveValue = gameGrid[# i - 1, j];
		}
		var optionsList = ds_list_create();
		for (var k = 1; k <= MAX_ITEM_TYPES; k++) {
			if (k != previousValue && k != aboveValue) {
				ds_list_add(optionsList, k);	
			}
		}
		var newValue = optionsList[| irandom(ds_list_size(optionsList) - 1)];
		gameGrid[# i, j] = newValue;
		show_debug_message(@"Value at [" + string(i) + ", " + string(j) + "] is: " + string(newValue));
	}
}

show_debug_message("Game grid created");

