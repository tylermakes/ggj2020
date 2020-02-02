/// @description Change color

if (currentColor + 1 >= array_length_1d(colors)) {
	currentColor = 0;	
} else {
	currentColor = currentColor + 1;	
}