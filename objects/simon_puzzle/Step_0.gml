/// @description Insert description here
// You can write your code in this editor
if (simonState == "play") {
	simonState = "playColorIn" //show_debug_message(@"1sim: " + simonState)
	if (whoseTurn == "computer") {
		currentColor = ds_list_find_value(simonSteps, currentIdx)
		//show_debug_message(@"C:" + currentColor + ", " + string(currentIdx))
	} else if (whoseTurn == "player") {
		currentColor = ds_list_find_value(playerInputs, currentIdx)
		//show_debug_message(@"P:" + currentColor + ", " + string(currentIdx))
	}
	if (currentColor == "red") {
		audio_play_sound(red_blip, 50, false);
	} else if (currentColor == "green") {
		audio_play_sound(green_boop, 50, false);
	} else if (currentColor == "blue") {
		audio_play_sound(blue_bleep, 50, false);
	}
	currentAlphaStep = 0
} else if (simonState == "playColorIn") {
	currentAlphaStep++
	if (currentAlphaStep >= PLAY_TOTAL_STEPS) {
		simonState = "playColorHold" //show_debug_message(@"2sim: " + simonState)
		delay = COLOR_HOLD_DELAY
	}
} else if (simonState == "waitToStart"
	|| simonState == "playColorHold"
	|| simonState == "playColorHoldOff"
	|| simonState == "waitForPlayer"
	|| simonState == "fail") {
		delay--
		if (delay <= 0) {
			if (simonState == "playColorHold") {
				simonState = "playColorOut" //show_debug_message(@"3sim: " + simonState)
			} else if (simonState == "playColorHoldOff") {
				if (whoseTurn == "computer") {
					if (currentIdx < ds_list_size(simonSteps) - 1) {
						simonState = "play" //show_debug_message(@"13sim: " + simonState)
						currentIdx++
					} else {
						currentIdx = 0 //show_debug_message(@"1ci: " + string(currentIdx))
						simonState = "waitForPlayer" //show_debug_message(@"4sim: " + simonState)
						whoseTurn = "player"
						delay = RESET_DELAY
						playerInputs = ds_list_create()
					}
				} else if (whoseTurn == "player") {
					if (currentIdx >= ds_list_size(simonSteps)	// you've gone too far
						|| currentColor != ds_list_find_value(simonSteps, currentIdx)) {	// you didn't match
							simonState = "fail" //show_debug_message(@"5sim: " + simonState)
							//show_debug_message("bad match, too many")
							//show_debug_message(string(currentIdx) + " > " + string(ds_list_size(simonSteps)))
							//show_debug_message(currentColor)
							//show_debug_message(ds_list_find_value(simonSteps, currentIdx))
							delay = FAIL_DELAY
					} else {
						if (currentIdx < ds_list_size(playerInputs) - 1) {
							//show_debug_message(" ?? " + string(ds_list_size(simonSteps)))
							//show_debug_message(string(currentIdx) + " ?< " + string(ds_list_size(playerInputs)))
							simonState = "play" //show_debug_message(@"15sim: " + simonState)
							currentIdx++
						} else {	// player input is done for now
							if (currentIdx == ds_list_size(simonSteps) - 1) {
								if (currentIdx < TOTAL_SIMON_ROUNDS - 1) {
									// add another round
									ds_list_add(simonSteps, choose("red", "green", "blue"))
									// use -1 idx and color hold off to delay between rounds
									simonState = "playColorHoldOff" //show_debug_message(@"6sim: " + simonState)
									delay = ROUND_HOLD_DELAY
									currentColor = "none"
									whoseTurn = "computer"
									currentIdx = -1 //show_debug_message(@"2ci: " + string(currentIdx))
									playerInputs = ds_list_create()
									kaijuInstance.damage = 0 // clear damage for a job well done
								} else {
									// if this is the case, we're done
									simonState = "complete" //show_debug_message(@"7sim: " + simonState)
									kaijuInstance.brainState = 0
								}
							} else {
								// otherwise, we're still waiting for more player input
								simonState = "waitForPlayer" //show_debug_message(@"8sim: " + simonState)
								delay = RESET_DELAY
							}
						}
					}
				}
			} else if (simonState == "waitToStart" || simonState == "fail") {
				// reset (either just starting or failed)
				simonState = "play" //show_debug_message(@"9sim: " + simonState)
				currentColor = "none"
				whoseTurn = "computer"
				currentIdx = 0 //show_debug_message(@"3ci: " + string(currentIdx))
			} else if (simonState == "waitForPlayer") {
				// player took too long, fail
				simonState = "fail" //show_debug_message(@"10sim: " + simonState)
				//show_debug_message("too long")
				delay = FAIL_DELAY
			}
		}
} else if (simonState == "playColorOut") {
	currentAlphaStep--
	if (currentAlphaStep <= 0) {
		simonState = "playColorHoldOff" //show_debug_message(@"11sim: " + simonState)
		delay = COLOR_OFF_HOLD_DELAY
	}
}
