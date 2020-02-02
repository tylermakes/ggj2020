/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(open_limb, 0, x + middle, y + middle - 30, 2, 2, 0, c_white, 1)
draw_sprite_ext(middle_limb, 0, x + middle + offsetArm, y + middle - 30, 2, 2, 0, complete ? c_white : c_red, complete ? 1 : 0.8)

leftFarColor = c_white
leftShortColor = c_white
rightShortColor = c_white
rightFarColor = c_white
switch(selection) {
	case 0: // left long
		leftFarColor = c_blue
	break;
	case 1: // left short
		leftShortColor = c_blue
	break;
	case 2: // right short
		rightShortColor = c_blue
	break;
	case 3: // right long
		rightFarColor = c_blue
	break;
}

draw_sprite_ext(left_far, 0, x + 60,  y + middle/2*3, 1, 1, 0, leftFarColor, 1)
draw_sprite_ext(left_short, 0, x + 120,  y + middle/2*3, 1, 1, 0, leftShortColor, 1)
draw_sprite_ext(right_short, 0, x + 280,  y + middle/2*3, 1, 1, 0, rightShortColor, 1)
draw_sprite_ext(right_far, 0, x + 340,  y + middle/2*3, 1, 1, 0, rightFarColor, 1)


if (complete) {
    draw_set_color(c_green)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    draw_text_transformed(x + middle, y + middle - 30, "SUCCESS!", 2, 2, rot)
	rot += 2
    draw_set_color(c_white)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}