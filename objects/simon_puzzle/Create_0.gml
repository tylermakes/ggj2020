/// @description Insert description here
// You can write your code in this editor
middle = 200
selection = 1
rot = 0

WAIT_TO_START = 10
PLAY_TOTAL_STEPS = 10
PLAY_STEPS = 1/PLAY_TOTAL_STEPS
RESET_DELAY = 200
FAIL_DELAY = 100
COLOR_HOLD_DELAY = 10
COLOR_OFF_HOLD_DELAY = 3
ROUND_HOLD_DELAY = 10
TOTAL_SIMON_ROUNDS = 3
currentColor = "none"
currentIdx = 0
currentAlphaStep = 0
simonState = "waitToStart"
whoseTurn = "computer"
delay = WAIT_TO_START
simonSteps = ds_list_create()
playerInputs = ds_list_create()
ds_list_add(simonSteps, choose("red", "green", "blue"))
