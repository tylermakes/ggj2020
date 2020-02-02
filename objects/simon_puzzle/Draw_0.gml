/// @description Insert description here
// You can write your code in this editor
heartScale = 0.7
heartX = x + middle
heartY = y + middle - 30
draw_sprite_ext(heart_base, 0, heartX, heartY, heartScale, heartScale, 0, c_white, 1)
draw_sprite_ext(heart_left, 0, heartX, heartY, heartScale, heartScale, 0, c_white, currentColor == "red" ? PLAY_STEPS * currentAlphaStep : 0)
draw_sprite_ext(heart_bottom, 0, heartX, heartY, heartScale, heartScale, 0, c_white, currentColor == "green" ? PLAY_STEPS * currentAlphaStep : 0)
draw_sprite_ext(heart_right, 0, heartX, heartY, heartScale, heartScale, 0, c_white, currentColor == "blue" ? PLAY_STEPS * currentAlphaStep : 0)

//leftFarColor = c_white
//leftShortColor = c_white
//rightShortColor = c_white
//rightFarColor = c_white
switch(currentColor) {
	case 0: // red
		//leftFarColor = c_blue
	break;
	case 1: // green
		//leftShortColor = c_blue
	break;
	case 2: // blue
		//rightShortColor = c_blue
	break;
}

draw_sprite_ext(butt_on, 0, x + 100,  y + middle/2*3, 0.5, 0.5, 0, c_red, 1)
draw_sprite_ext(butt_on, 0, x + 200,  y + middle/2*3, 0.5, 0.5, 0, c_green, 1)
draw_sprite_ext(butt_on, 0, x + 300,  y + middle/2*3, 0.5, 0.5, 0, c_blue, 1)

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

draw_text(x + 300, y + 300, @"state: " + simonState)
