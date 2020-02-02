/// @description Insert description here
// You can write your code in this editor
centerX = x + 130
centerY = y + 130

if (legPosition >= HALF_STEPS) {
	legDir = "up"
} else if (legPosition <= -HALF_STEPS)  {
	legDir = "down"
}

if (legPosition >= ARM_HALF_STEPS) {
	armDir = "forward"
} else if (legPosition <= -ARM_HALF_STEPS)  {
	armDir = "backward"
}

isWalking = kaijuState == "walking" || kaijuState == "walking_done"
if (isWalking) {
	if (legDir == "up") {
		legPosition--
	} else {
		legPosition++
	}
	
	if (armDir == "forward") {
		armPosition--
	} else {
		armPosition++
	}
}

if (dead) {
	instance_destroy()
}