

leftArmX = x + 10
leftArmY = y
rightArmX = x - 20
rightArmY = y + 20
armMiddleRot = 0
isWalking = kaijuState == "walking" || kaijuState == "walking_done"
leftArmRot = isWalking ? armMiddleRot + (armPosition * ARM_ROT_SPEED) : armMiddleRot
rightArmRot = isWalking ? armMiddleRot - (armPosition * ARM_ROT_SPEED) : armMiddleRot


leftLegX = x + 20
rightLegX = x - 10
legMiddle = y + 100
legMiddleRot = 0
leftLegY = leftLegState == 0 ? legMiddle + (legPosition * LEG_STEP_DISTANCE) : legMiddle
rightLegY = rightLegState == 0 ? legMiddle - (legPosition * LEG_STEP_DISTANCE) : legMiddle
leftLegRot = leftLegState == 0 ? legMiddleRot + (legPosition * LEG_ROT_DISTANCE) : legMiddleRot
rightLegRot = rightLegState == 0 ? legMiddleRot - (legPosition * LEG_ROT_DISTANCE) : legMiddleRot

bodyX = x
bodyY = y
headX = x - 5
headY = y - 27

draw_sprite_ext(g_right_leg, 0, rightLegX, rightLegY, -1, 1, rightLegRot, rightLegState != 0 ? c_red : c_white, 1)
draw_sprite_ext(g_right_arm, 0, rightArmX, rightArmY, -1, 1, rightArmRot, rightArmState != 0 ? c_red : c_white, 1)

draw_sprite_ext(g_body, 0, bodyX, bodyY, -1, 1, 0, heartState != 0 ? c_red : c_white, 1)
draw_sprite_ext(g_head, 0, headX, headY, -1, 1, 0, brainState != 0 ? c_red : c_white, 1)

draw_sprite_ext(g_left_arm, 0, leftArmX, leftArmY, -1, 1, leftArmRot, leftArmState != 0 ? c_red : c_white, 1)
draw_sprite_ext(g_left_leg, 0, leftLegX, leftLegY, -1, 1, leftLegRot, leftLegState != 0 ? c_red : c_white, 1)


//draw_sprite_ext(mask_index,0,x,y,1,1,0,c_aqua,0.5)

var talkIcon = smile
switch(kaijuTalk) {
	case 0: // heart
		talkIcon = heart
	break;
	case 1: // burger
		talkIcon = burger
	break;
	case 2: // smile
		talkIcon = smile
	break;
	case 3: // helicopter_icon
		talkIcon = helicopter_icon
	break;
	case 4: // mad_face
		talkIcon = mad_face
	break;
	case 5: // oops_face
		talkIcon = oops_face
	break;
}

if (kaijuTalk >= 0) {
	draw_sprite(balloon,0,  x - 180, y - 90)
	draw_sprite(talkIcon, 0, x - 180, y - 90)
}