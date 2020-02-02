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

if (leftArmPosition <= 0) {
	leftArmPosition = 360
} else {
	leftArmPosition -= ARM_ROT_SPEED
}

if (rightArmPosition <= 0) {
	rightArmPosition = 360
} else {
	rightArmPosition -= ARM_ROT_SPEED
}