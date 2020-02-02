/// @description Insert description here
// You can write your code in this editor
delay--
if (delay <= 0) {
	room_goto(game_screen)
}
show_debug_message(string(delay))