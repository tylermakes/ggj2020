
WALK_SPEED = 4
JUMP_SPEED = 4
BULLET_SPEED = 10
backgroundWidth = sprite_get_width(background_spr)
KAIJU_JUMP_DISTANCE = 200 // distance from which the kaiju will jump if it can
KAIJU_JUMP_DISTANCE_BUFFER = 40 // buffer distance in which the kaiju can jump (otherwise it's too close)
KAIJU_STOP_DISTANCE_BUFFER = 20 // buffer distance in which the kaiju can be stopped (otherwise it's past the building)
KAIJU_STOP_DISTANCE = 120 // distance at which the kaiju will run into a building and stop
KAIJU_SHOOT_DISTANCE_BUFFER = 100 // buffer distance in which the kaiju can be shot (otherwise it's gone past)
KAIJU_SHOOT_DISTANCE = 600 // distance at which the kaiju will get shot
KAIJU_JUMP_TIME = 50	// how long the kaiju will go up and down when it jumps
KAIJU_STOP_TIME = 30	// how long the kaiju will stop before trying to reverse
KAIJU_REVERSE_TIME = 30	// how long the kaiju will go in reverse before going forward again
KAIJU_DAMAGE_BEFORE_INJURY = 30	// amount of damage kaiju can take before a limb gets injured
KAIJU_STOP_DAMAGE = 10	// damage kaiju takes from running into a building
BUILDING_HEIGHT = 370 // the height where the building should be
BUILDING_RANGE = 45 // the range above BUILDING_HEIGHT that the building can be in
HELI_HEIGHT = 300 // the height where the building should be
HELI_RANGE = 200 // the range above HELI_HEIGHT that the building can be in
SHOOT_TIME = 10

if (kaijuInstance.kaijuState == "walking"
	|| kaijuInstance.kaijuState == "walkingReverse"
	|| kaijuInstance.kaijuState == "jumping_up"
	|| kaijuInstance.kaijuState == "jumping_down") {
		
	walkSpeed = kaijuInstance.kaijuState == "walkingReverse" ? -WALK_SPEED : WALK_SPEED
	
	// move the bg
	kaijuInstance.bgInstance.x = kaijuInstance.bgInstance.x - walkSpeed
	kaijuInstance.bgInstanceFlipped.x = kaijuInstance.bgInstanceFlipped.x - walkSpeed

	// handle adding obstacles as necessary
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
			obstacle1.type = choose("helicopter", "building")
			obstacle1.jumpable = false
			switch (obstacle1.type) {
				case "building":
					obstacle1.sprite_index = building_spr
					obstacle1.jumpable = true
					obstacle1.y = irandom_range(BUILDING_HEIGHT, BUILDING_HEIGHT - BUILDING_RANGE)
				break;
				case "helicopter":
					obstacle1.sprite_index = helicopter_shooting_spr
					obstacle1.y = irandom_range(HELI_HEIGHT, HELI_HEIGHT - HELI_RANGE)
					obstacle1.state = "dontshoot"
				break;
			}
			//show_debug_message(@"creating at:" + string(kaijuInstance.currentObstacleIndex))
            kaijuInstance.obstacles[kaijuInstance.currentObstacleIndex] = obstacle1
            kaijuInstance.currentObstacleIndex++
            if (kaijuInstance.currentObstacleIndex >= kaijuInstance.TOTAL_OBSTACLES) {
                kaijuInstance.currentObstacleIndex = 0
            }
        }
	}
	// /handle adding obstacles as necessary
	
	
	for (var i = 0; i < array_length_1d(kaijuInstance.obstacles); i++) {
		if (instance_exists(kaijuInstance.obstacles[i])) {
			kaijuInstance.obstacles[i].x = kaijuInstance.obstacles[i].x - walkSpeed
			if (kaijuInstance.obstacles[i].x < -300) {
				kaijuInstance.obstacles[i].dead = "true"
			}
			
			if (kaijuInstance.kaijuState != "jumping_up"
				&& kaijuInstance.kaijuState != "jumping_down") {
				// do obstacle collision
				if (kaijuInstance.obstacles[i].jumpable == true &&
					kaijuInstance.obstacles[i].x - kaijuInstance.kaijuMonster.x < KAIJU_JUMP_DISTANCE &&
					kaijuInstance.obstacles[i].x - kaijuInstance.kaijuMonster.x > KAIJU_JUMP_DISTANCE - KAIJU_JUMP_DISTANCE_BUFFER) {
						// if kaiju can jump, then jump
						if (kaijuInstance.leftLegState == 0 && kaijuInstance.rightLegState == 0) {
							kaijuInstance.kaijuState = "jumping_up"
							kaijuInstance.delayedTime = KAIJU_JUMP_TIME
						}
				} else if (kaijuInstance.obstacles[i].jumpable == true && kaijuInstance.obstacles[i].x - kaijuInstance.kaijuMonster.x < KAIJU_STOP_DISTANCE
					&& kaijuInstance.obstacles[i].x - kaijuInstance.kaijuMonster.x > KAIJU_STOP_DISTANCE - KAIJU_STOP_DISTANCE_BUFFER) {
					kaijuInstance.kaijuState = "stopped"
					kaijuInstance.delayedTime = KAIJU_STOP_TIME
					kaijuInstance.damage += KAIJU_STOP_DAMAGE
				}
			}
			
			// handle helicopter
			if (kaijuInstance.obstacles[i].type == "helicopter") {
				var h = kaijuInstance.obstacles[i];
				if (h.x - kaijuInstance.kaijuMonster.x < KAIJU_SHOOT_DISTANCE
					&& h.x - kaijuInstance.kaijuMonster.x > KAIJU_SHOOT_DISTANCE - KAIJU_SHOOT_DISTANCE_BUFFER) {
						if (h.state != "shoot") {
							h.shootTime = 0
						}
						h.state = "shoot"
						h.dir = point_direction(h.x, h.y, kaijuInstance.kaijuMonster.centerX, kaijuInstance.kaijuMonster.centerY);
				} else {
					h.state = "dontshoot"
				}
				
				if (h.state == "shoot") {
					if (h.shootTime > 0) {
						h.shootTime--
					} else {
						var bull = instance_create_layer(h.x, h.y, "Bullets", bullet_obj)
						bull.kaijuInstance = kaijuInstance
						bull.direction = h.dir
						bull.x = h.x
						bull.y = h.y
						bull.image_xscale = .5
						bull.image_yscale = .5
						bull.speed = BULLET_SPEED
						h.shootTime = SHOOT_TIME
					}
				}
			}
		}
	}
	
	// handle jumping up/down
	if (kaijuInstance.kaijuState == "jumping_up" || kaijuInstance.kaijuState == "jumping_down") {
		kaijuInstance.kaijuMonster.y += kaijuInstance.kaijuState == "jumping_up" ? -JUMP_SPEED : JUMP_SPEED
		if (kaijuInstance.delayedTime > 0) {
			kaijuInstance.delayedTime--
		} else {
			if (kaijuInstance.kaijuState == "jumping_up") {
				kaijuInstance.kaijuState = "jumping_down"
				kaijuInstance.delayedTime = KAIJU_JUMP_TIME
			} else {
				kaijuInstance.kaijuState = "walking"
			}
		}
	}
	
	// handle walking reverse state
	if (kaijuInstance.kaijuState == "walkingReverse") {
		if (kaijuInstance.delayedTime > 0) {
			kaijuInstance.delayedTime--
		} else {
			kaijuInstance.kaijuState = "walking"
		}
	}
} else if (kaijuInstance.kaijuState == "stopped") {
	if (kaijuInstance.delayedTime > 0) {
		kaijuInstance.delayedTime--
	} else {
		kaijuInstance.kaijuState = "walkingReverse"
		kaijuInstance.delayedTime = KAIJU_REVERSE_TIME
	}
}

if (kaijuInstance.damage >= KAIJU_DAMAGE_BEFORE_INJURY) {
	show_debug_message("======== INJURED! ======")
	kaijuInstance.damage = 0
} else {
	//show_debug_message(@"dmg:" + string(kaijuInstance.damage))
}

// wrap the background
if (kaijuInstance.bgInstance.x < -backgroundWidth) {
	kaijuInstance.bgInstance.x = kaijuInstance.bgInstanceFlipped.x + backgroundWidth
}
if (kaijuInstance.bgInstanceFlipped.x < -backgroundWidth) {
	kaijuInstance.bgInstanceFlipped.x = kaijuInstance.bgInstance.x + backgroundWidth
}