

leftArmRot = leftArmState == 0 ? leftArmPosition : 0
rightArmRot = rightArmState == 0 ? rightArmPosition : 0

leftArmX = x
leftArmY = y + 20
rightArmX = x + 120
rightArmY = y + 20


leftLegX = x + 20
rightLegX = x + 100
legMiddle = y + 122
legMiddleRot = 0
leftLegY = leftLegState == 0 ? legMiddle + (legPosition * LEG_STEP_DISTANCE) : legMiddle
rightLegY = rightLegState == 0 ? legMiddle - (legPosition * LEG_STEP_DISTANCE) : legMiddle
leftLegRot = leftLegState == 0 ? legMiddleRot + (legPosition * LEG_ROT_DISTANCE) : legMiddleRot
rightLegRot = rightLegState == 0 ? legMiddleRot - (legPosition * LEG_ROT_DISTANCE) : legMiddleRot

draw_sprite_ext(temp_limb_walk, 0, rightLegX, rightLegY, 0.5, 0.5, rightLegRot, rightLegState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_limb_walk, 0, rightArmX, rightArmY, 0.5, 0.5, rightArmRot, rightArmState != 0 ? c_red : c_white, 1)

draw_sprite_ext(temp_head, 0, x + 40, y - 90, 0.5, 0.5, 0, brainState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_body, 0, x, y, 0.5, 0.5, 0, heartState != 0 ? c_red : c_white, 1)

draw_sprite_ext(temp_limb_walk, 0, leftArmX, leftArmY, 0.5, 0.5, leftArmRot, leftArmState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_limb_walk, 0, leftLegX, leftLegY, 0.5, 0.5, leftLegRot, leftLegState != 0 ? c_red : c_white, 1)


//draw_sprite_ext(mask_index,0,x,y,1,1,0,c_aqua,0.5)