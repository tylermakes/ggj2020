/// @description Insert description here
// You can write your code in this editor
if (!complete && offsetArm < buffer && offsetArm > - buffer) {
	complete = true
	offsetArm = -10

	switch(selectedLimb) {
	    case 0: // brain
            kaijuInstance.brainState = 0
	    break;
	    case 1: // heart
            kaijuInstance.heartState = 0
	    break;
	    case 2:  // leftArm
            kaijuInstance.leftArmState = 0
	    break;
	    case 3: // rightArm
            kaijuInstance.rightArmState = 0
	    break;
	    case 4: // leftLeg
            kaijuInstance.leftLegState = 0
	    break;
	    case 5: // rightLeg
            kaijuInstance.rightLegState = 0
	    break;
	}
}
