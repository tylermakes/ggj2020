kaijuX = 1024/4
kaijuY = 768/3
OBSTACLE_SPACING = 200
nextObstacle = OBSTACLE_SPACING
TOTAL_OBSTACLES = floor(1024/OBSTACLE_SPACING * 2)
obstacles = []
currentObstacleIndex = 0
kaijuState = "walking"

//show_debug_message(@"TOTAL_OBS: " + string(TOTAL_OBSTACLES))
//show_debug_message(@"obs leng: " + string(array_length_1d(obstacles)))

kaijuMonster = instance_create_layer(kaijuX, kaijuY, "KaijuInstances", temp_kaiju)

bgInstance = instance_create_layer(0, 0, "KaijuInstances", background)
bgInstanceFlipped = instance_create_layer(sprite_get_width(background_spr), 0, "KaijuInstances", background)
bgInstanceFlipped.image_index = 1

