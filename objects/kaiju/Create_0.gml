leftArmState = 0
rightArmState = 0
heartState = 0
brainState = 0
leftLegState = 0
rightLegState = 0

kaijuX = 1024/4
kaijuY = 768/4
OBSTACLE_DISTANCE = 400
nextObstacle = OBSTACLE_DISTANCE
TOTAL_OBSTACLES = floor(1024/OBSTACLE_DISTANCE) * 2
obstacles = []
currentObstacleIndex = 0
kaijuState = "walking"
delayedTime = 0
damage = 0

//show_debug_message(@"TOTAL_OBS: " + string(TOTAL_OBSTACLES))
//show_debug_message(@"obs leng: " + string(array_length_1d(obstacles)))

kaijuMonster = instance_create_layer(kaijuX, kaijuY, "KaijuInstances", temp_kaiju)

bgInstance = instance_create_layer(0, 0, "KaijuInstances", background)
bgInstanceFlipped = instance_create_layer(sprite_get_width(background_spr), 0, "KaijuInstances", background)
bgInstanceFlipped.image_index = 1

