draw_sprite_ext(temp_head, 0, x + 40, y - 90, 0.5, 0.5, 0, brainState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_body, 0, x, y, 0.5, 0.5, 0, heartState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_limb, 0, x - 10, y, 0.5, 0.5, 0, leftArmState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_limb, 0, x + 100, y, 0.5, 0.5, 0, rightArmState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_limb, 0, x - 10, y + 100, 0.5, 0.5, 0, leftLegState != 0 ? c_red : c_white, 1)
draw_sprite_ext(temp_limb, 0, x + 100, y + 100, 0.5, 0.5, 0, rightLegState != 0 ? c_red : c_white, 1)

//draw_sprite_ext(mask_index,0,x,y,1,1,0,c_aqua,0.5)