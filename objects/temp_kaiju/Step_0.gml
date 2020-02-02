/// @description Insert description here
// You can write your code in this editor
centerX = x + 130
centerY = y + 130

if (legPosition >= HALF_STEPS) {
	legDir = "up"
} else if (legPosition <= -HALF_STEPS)  {
	legDir = "down"
}

if (kaijuState == "walking") {
	if (legDir == "up") {
		legPosition--
	} else {
		legPosition++
	}
}

if (leftArmPosition >= 360) {
	leftArmPosition = 0
} else {
	leftArmPosition += ARM_ROT_SPEED
}

if (rightArmPosition >= 360) {
	rightArmPosition = 0
} else {
	rightArmPosition += ARM_ROT_SPEED
}