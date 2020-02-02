/// @description Insert description here
// You can write your code in this editor
if (p1Mode == "body") {
	currentSelection = p1Map.bodySelection
	switch(currentSelection) {
	    case 0: // brain
			p1Game = instance_create_layer(0, 368, "PuzzleInstances", simon_puzzle)
	    break;
	    case 1: // heart
			p1Game = instance_create_layer(0, 368, "PuzzleInstances", match_three_puzzle)
	    break;
	    case 2:  // leftArm
			p1Game = instance_create_layer(0, 368, "PuzzleInstances", line_puzzle)
	    break;
	    case 3: // rightArm
			p1Game = instance_create_layer(0, 368, "PuzzleInstances", line_puzzle)
	    break;
	    case 4: // leftLeg
			p1Game = instance_create_layer(0, 368, "PuzzleInstances", line_puzzle)
	    break;
	    case 5: // rightLeg
			p1Game = instance_create_layer(0, 368, "PuzzleInstances", line_puzzle)
	    break;
	}
	p1Game.selectedLimb = currentSelection
	p1Game.kaijuInstance = kaijuInstance
	instance_destroy(p1Map)
	p1Mode = "game"
} else if (p1Mode == "game") {
	p1Map = instance_create_layer(0, 400, "Instances", body_map)
	p1Map.bodySelection = currentSelection
	p1Map.kaijuInstance = kaijuInstance
	instance_destroy(p1Game)
	p1Mode = "body"
}