kaijuState = kaijuInstance.kaijuState
leftLegState = kaijuInstance.leftLegState
rightLegState = kaijuInstance.rightLegState
leftArmState = kaijuInstance.leftArmState
rightArmState = kaijuInstance.rightArmState
heartState = kaijuInstance.heartState
brainState = kaijuInstance.brainState
damage = kaijuInstance.damage

draw_set_color(c_white)
draw_text(x, y, @"KAIJU STATE:" + kaijuState)
draw_text(x, y + 15, @"LEFT LEG:" + string(leftLegState))
draw_text(x, y + 30, @"RIGHT LEG:" + string(rightLegState))
draw_text(x, y + 45, @"LEFT ARM:" + string(leftArmState))
draw_text(x, y + 60, @"RIGHT ARM:" + string(rightArmState))
draw_text(x, y + 75, @"HEART:" + string(heartState))
draw_text(x, y + 90, @"BRAIN:" + string(brainState))
draw_text(x, y + 105, @"DMG:" + string(damage))

brainColor = brainState != 0 ? c_red : c_white
heartColor = heartState != 0 ? c_red : c_white
leftArmColor = leftArmState != 0 ? c_red : c_white
rightArmColor = rightArmState != 0 ? c_red : c_white
leftLegColor = leftLegState != 0 ? c_red : c_white
rightLegColor = rightLegState != 0 ? c_red : c_white

switch(bodySelection) {
    case 0: // brain
        brainColor = c_blue
    break;
    case 1: // heart
        heartColor = c_blue
    break;
    case 2:  // leftArm
        leftArmColor = c_blue
    break;
    case 3: // rightArm
        rightArmColor = c_blue
    break;
    case 4: // leftLeg
        leftLegColor = c_blue
    break;
    case 5: // rightLeg
        rightLegColor = c_blue
    break;
}

xOffset = 100
yOffset = 150

draw_sprite_ext(temp_head, 0, x + xOffset + 40,  y + yOffset - 90, 0.5, 0.5, 0, brainColor, 1)
draw_sprite_ext(temp_body, 0, x + xOffset,       y + yOffset, 0.5, 0.5, 0, heartColor, 1)
draw_sprite_ext(temp_limb, 0, x + xOffset - 10,  y + yOffset, 0.5, 0.5, 0, leftArmColor, 1)
draw_sprite_ext(temp_limb, 0, x + xOffset + 100, y + yOffset, 0.5, 0.5, 0, rightArmColor, 1)
draw_sprite_ext(temp_limb, 0, x + xOffset - 10,  y + yOffset + 100, 0.5, 0.5, 0, leftLegColor, 1)
draw_sprite_ext(temp_limb, 0, x + xOffset + 100, y + yOffset + 100, 0.5, 0.5, 0, rightLegColor, 1)
