/// @description Render and update the grid contents
var ORIGIN_X = 0;
var ORIGIN_Y = 368;
var OBJECT_DIMENSION = 80;
var objectTypes = ds_map_create();

objectTypes[? 1] = helicopter_spr;
objectTypes[? 2] = meat_spr;
objectTypes[? 3] = pear_spr;
objectTypes[? 4] = tank_spr;
objectTypes[? 5] = building_spr;

for (var i = 0; i < GRID_SIZE; i++) {
	for (var j = 0; j < GRID_SIZE; j++) {
		draw_sprite(objectTypes[? gameGrid[# i, j]], 0, ORIGIN_X + (i * OBJECT_DIMENSION), ORIGIN_Y + (j * OBJECT_DIMENSION));
	}
}
