/// @description Creator for the flow puzzle
GRID_SIZE = 5;
OBJECT_DIMENSION = 80;
DELAY = 60;
WIN_CONDITION = 2;

rot = 0;
complete = false;
winsCounter = 0;
delayCounter = DELAY;
gridCalculating = false;
gameGrid = ds_grid_create(GRID_SIZE, GRID_SIZE);
selectorLocation = array_create(2);
currentColor = "R";

selectorLocation[0] = 0;
selectorLocation[1] = 0;

redStart = array_create(2);
blueStart = array_create(2);
greenStart = array_create(2);
redEnd = array_create(2);
blueEnd = array_create(2);
greenEnd = array_create(2);

for (var i = 0; i < GRID_SIZE; i++) {
	for (var j = 0; j < GRID_SIZE; j++) {
		gameGrid[# i, j] = 0;
	}
}

do {
	redStart[0] = irandom(4);
	redStart[1] = irandom(4);
} until (gameGrid[# redStart[0], redStart[1]] == 0);
gameGrid[# redStart[0], redStart[1]] = "R";
do {
	blueStart[0] = irandom(4);
	blueStart[1] = irandom(4);
} until (gameGrid[# blueStart[0], blueStart[1]] == 0);
gameGrid[# blueStart[0], blueStart[1]] = "B";
do {
	greenStart[0] = irandom(4);
	greenStart[1] = irandom(4);
} until (gameGrid[# greenStart[0], greenStart[1]] == 0);
gameGrid[# greenStart[0], greenStart[1]] = "G";
do {
	redEnd[0] = irandom(4);
	redEnd[1] = irandom(4);
} until (gameGrid[# redEnd[0], redEnd[1]] == 0);
gameGrid[# redEnd[0], redEnd[1]] = "R";
do {
	blueEnd[0] = irandom(4);
	blueEnd[1] = irandom(4);
} until (gameGrid[# blueEnd[0], blueEnd[1]] == 0);
gameGrid[# blueEnd[0], blueEnd[1]] = "B";
do {
	greenEnd[0] = irandom(4);
	greenEnd[1] = irandom(4);
} until (gameGrid[# greenEnd[0], greenEnd[1]] == 0);
gameGrid[# greenEnd[0], greenEnd[1]] = "G";
