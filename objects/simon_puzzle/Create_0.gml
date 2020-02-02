/// @description Insert description here
// You can write your code in this editor
middle = 200
complete = false
selection = 1
rot = 0

WAIT_TO_START = 30
PLAY_TOTAL_STEPS = 20
PLAY_STEPS = 1/PLAY_TOTAL_STEPS
RESET_DELAY = 100
COLOR_HOLD_DELAY = 10
currentColor = "none"
currentIdx = 0
currentAlphaStep = 0
simonState = "waitToStart"
delay = WAIT_TO_START
simonSteps = ds_list_create()
ds_list_add(simonSteps, choose("red", "green", "blue"))