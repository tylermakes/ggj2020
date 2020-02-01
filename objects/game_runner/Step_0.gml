
walkSpeed = 4
backgroundWidth = sprite_get_width(background_spr)
KAIJU_JUMP_DISTANCE = 120

if (kaijuInstance.kaijuState == "walking") {
	// move the bg
	kaijuInstance.bgInstance.x = kaijuInstance.bgInstance.x - walkSpeed
	kaijuInstance.bgInstanceFlipped.x = kaijuInstance.bgInstanceFlipped.x - walkSpeed

	// handle obstacle
	kaijuInstance.nextObstacle = kaijuInstance.nextObstacle - 1
	if (kaijuInstance.nextObstacle <= 0) {
		kaijuInstance.nextObstacle = kaijuInstance.OBSTACLE_SPACING

		// show_debug_message(array_length_1d(obstacles))
        canCreate = true
        if (array_length_1d(kaijuInstance.obstacles) > kaijuInstance.currentObstacleIndex) {
            canCreate = !instance_exists(kaijuInstance.obstacles[kaijuInstance.currentObstacleIndex])
        }
        //show_debug_message(@"cancreate:" + string(canCreate))
        if (canCreate) {
            var obstacle1 = instance_create_layer(1050, 340, "KaijuObs", obstacle)
			show_debug_message(@"creating at:" + string(kaijuInstance.currentObstacleIndex))
            kaijuInstance.obstacles[kaijuInstance.currentObstacleIndex] = obstacle1
            kaijuInstance.currentObstacleIndex++
            if (kaijuInstance.currentObstacleIndex >= kaijuInstance.TOTAL_OBSTACLES) {
                kaijuInstance.currentObstacleIndex = 0
            }
        }
	}
	
	for (var i = 0; i < array_length_1d(kaijuInstance.obstacles); i++) {
		if (instance_exists(kaijuInstance.obstacles[i])) {
			kaijuInstance.obstacles[i].x = kaijuInstance.obstacles[i].x - walkSpeed
			if (kaijuInstance.obstacles[i].x < -300) {
				kaijuInstance.obstacles[i].dead = "true"
			}
			if (kaijuInstance.obstacles[i].x - kaijuInstance.kaijuMonster.x < KAIJU_JUMP_DISTANCE) {
				kaijuInstance.kaijuState = "stopped"
			}
		}
	}
}

// wrap the background
if (kaijuInstance.bgInstance.x < -backgroundWidth) {
	kaijuInstance.bgInstance.x = kaijuInstance.bgInstanceFlipped.x + backgroundWidth
}
if (kaijuInstance.bgInstanceFlipped.x < -backgroundWidth) {
	kaijuInstance.bgInstanceFlipped.x = kaijuInstance.bgInstance.x + backgroundWidth
}