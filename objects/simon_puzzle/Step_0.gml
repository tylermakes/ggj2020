/// @description Insert description here
// You can write your code in this editor
test = false
if (simonState == "play") {
	simonState = "playColorIn"
	currentColor = ds_list_find_value(simonSteps, currentIdx)
	currentAlphaStep = 0
} else if (simonState = "playColorIn") {
	currentAlphaStep++
	if (currentAlphaStep >= PLAY_TOTAL_STEPS) {
		simonState = "playColorHold"
		delay = COLOR_HOLD_DELAY
	}
} else if (simonState == "waitToStart"
	|| simonState == "playColorHold"
	|| simonState == "playColorHoldOff") {
		delay--
		if (delay <= 0) {
			if (simonState == "playColorHold") {
				simonState = "playColorOut"
			} else if (simonState == "playColorHoldOff") {
				simonState = "play"
				if (currentIdx < ds_list_size(simonSteps)) {
					currentIdx++
				} else {
					currentIdx = 0
					simonState = "waitForPlayer"
					delay = RESET_DELAY
				}
			} else if (simonState == "waitToStart") {
				simonState = "play"
			} else if (simonState == "waitForPlayer") {
				simonState = "play"
				currentColor = "none"
			}
		}
} else if (simonState == "playColorOut") {
	currentAlphaStep--
	if (currentAlphaStep <= 0) {
		simonState = "playColorHoldOff"
		delay = COLOR_HOLD_DELAY
	}
}

if (!complete && test) {
	complete = true
	kaijuInstance.brainState = 0
}
