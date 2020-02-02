/// @description Insert description here
// You can write your code in this editor
if (simonState != "complete" && whoseTurn == "player") {
	switch(selection) {
		case 0: // red
			nextColor = "red"
		break;
		case 1: // green
			nextColor = "green"
		break;
		case 2: // blue
			nextColor = "blue"
		break;
	}
	if (ds_list_size(playerInputs) <= 0) {
		currentIdx = 0 //show_debug_message(@"SPci: " + string(currentIdx))
		simonState = "play" //show_debug_message(@"SP1sim: " + simonState)
	}
	if (simonState == "waitForPlayer") {
		currentIdx++
		simonState = "play" //show_debug_message(@"SP2sim: " + simonState)
	}
	ds_list_add(playerInputs, nextColor)
	//show_debug_message(@"add color " + nextColor)
}
