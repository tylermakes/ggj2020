/// @description Insert description here
// You can write your code in this editor
heartScale = 0.7
heartX = x + middle
heartY = y + middle - 30
draw_sprite_ext(heart_base, 0, heartX, heartY, heartScale, heartScale, 0, c_white, 1)
draw_sprite_ext(heart_left, 0, heartX, heartY, heartScale, heartScale, 0, c_white, currentColor == "red" ? PLAY_STEPS * currentAlphaStep : 0)
draw_sprite_ext(heart_bottom, 0, heartX, heartY, heartScale, heartScale, 0, c_white, currentColor == "green" ? PLAY_STEPS * currentAlphaStep : 0)
draw_sprite_ext(heart_right, 0, heartX, heartY, heartScale, heartScale, 0, c_white, currentColor == "blue" ? PLAY_STEPS * currentAlphaStep : 0)

redButtAlpha = 0.5
greenButtAlpha = 0.5
blueButtAlpha = 0.5

redColor = c_red
greenColor = c_lime
blueColor = c_blue
if (whoseTurn != "player") {
	redColor = c_gray
	blueColor = c_gray
	greenColor = c_gray
} else {
	switch(selection) {
		case 0: // red
			redButtAlpha = 1
		break;
		case 1: // green
			greenButtAlpha = 1
		break;
		case 2: // blue
			blueButtAlpha = 1
		break;
	}
}

draw_sprite_ext(butt_on, 0, x + 100,  y + middle/2*3, 0.5, 0.5, 0, redColor, redButtAlpha)
draw_sprite_ext(butt_on, 0, x + 200,  y + middle/2*3, 0.5, 0.5, 0, greenColor, greenButtAlpha)
draw_sprite_ext(butt_on, 0, x + 300,  y + middle/2*3, 0.5, 0.5, 0, blueColor, blueButtAlpha)

if (simonState == "complete") {
    draw_set_color(c_green)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    draw_text_transformed(x + middle, y + middle - 30, "SUCCESS!", 2, 2, rot)
	rot += 2
    draw_set_color(c_white)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

draw_text(x + 10, y + 350, @"state: " + simonState)

for (var i = 0; i < ds_list_size(playerInputs); i++) {
	var inColor = ds_list_find_value(playerInputs, i)
	var c = c_red
	if (inColor == "green") c = c_green
	if (inColor == "blue") c = c_blue
	draw_sprite_ext(butt_on, 0, x + 20 + (20 * i),  y + 380, 0.1, 0.1, 0, c, 1)
}

if (simonState == "fail") {
    draw_set_color(c_red)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    draw_text_transformed(x + middle, y + middle - 30, "= X =", 4, 4, 0)
    draw_set_color(c_white)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
