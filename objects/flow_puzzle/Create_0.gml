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

selectorLocation[0] = 0;
selectorLocation[1] = 0;

redStart = array_create(2);
redStart[0] = irandom(4);
redStart[1] = irandom(4);
blueStart = array_create(2);
blueStart[0] = irandom(4);
blueStart[1] = irandom(4);
greenStart = array_create(2);
greenStart[0] = irandom(4);
greenStart[1] = irandom(4);

redEnd = array_create(2);
redEnd[0] = irandom(4);
redEnd[1] = irandom(4);
blueEnd = array_create(2);
blueEnd[0] = irandom(4);
blueEnd[1] = irandom(4);
greenEnd = array_create(2);
greenEnd[0] = irandom(4);
greenEnd[1] = irandom(4);
