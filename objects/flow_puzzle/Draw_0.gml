/// @description Draw the initial nodes and update the paths

draw_set_color(c_blue);
draw_rectangle(x + (blueStart[0] * OBJECT_DIMENSION), y + (blueStart[1] * OBJECT_DIMENSION), x + ((blueStart[0] + 1) * OBJECT_DIMENSION), y + ((blueStart[1] + 1) * OBJECT_DIMENSION), false);
draw_rectangle(x + (blueEnd[0] * OBJECT_DIMENSION), y + (blueEnd[1] * OBJECT_DIMENSION), x + ((blueEnd[0] + 1) * OBJECT_DIMENSION), y + ((blueEnd[1] + 1) * OBJECT_DIMENSION), false);
draw_set_color(c_red);
draw_rectangle(x + (redStart[0] * OBJECT_DIMENSION), y + (redStart[1] * OBJECT_DIMENSION), x + ((redStart[0] + 1) * OBJECT_DIMENSION), y + ((redStart[1] + 1) * OBJECT_DIMENSION), false);
draw_rectangle(x + (redEnd[0] * OBJECT_DIMENSION), y + (redEnd[1] * OBJECT_DIMENSION), x + ((redEnd[0] + 1) * OBJECT_DIMENSION), y + ((redEnd[1] + 1) * OBJECT_DIMENSION), false);
draw_set_color(c_green);
draw_rectangle(x + (greenStart[0] * OBJECT_DIMENSION), y + (greenStart[1] * OBJECT_DIMENSION), x + ((greenStart[0] + 1) * OBJECT_DIMENSION), y + ((greenStart[1] + 1) * OBJECT_DIMENSION), false);
draw_rectangle(x + (greenEnd[0] * OBJECT_DIMENSION), y + (greenEnd[1] * OBJECT_DIMENSION), x + ((greenEnd[0] + 1) * OBJECT_DIMENSION), y + ((greenEnd[1] + 1) * OBJECT_DIMENSION), false);