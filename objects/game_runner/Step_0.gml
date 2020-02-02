
if (kaijuInstance.kaijuState == "walking"
	|| kaijuInstance.kaijuState == "walkingReverse"
	|| kaijuInstance.kaijuState == "jumping_up"
	|| kaijuInstance.kaijuState == "jumping_down") {

	walkSpeed = kaijuInstance.kaijuState == "walkingReverse" ? -WALK_SPEED : WALK_SPEED

	if (kaijuInstance.leftLegState != 0 && kaijuInstance.rightLegState != 0) {
		walkSpeed = 0
	}

	// move the bg
	kaijuInstance.bgInstance.x = kaijuInstance.bgInstance.x - walkSpeed
	kaijuInstance.bgInstanceFlipped.x = kaijuInstance.bgInstanceFlipped.x - walkSpeed

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
	walkSpeed = 0
	if (kaijuInstance.delayedTime > 0) {
		kaijuInstance.delayedTime--
	} else {
	   //show_debug_message(@"delay: " + string(kaijuInstance.delayedTime))
		kaijuInstance.kaijuState = "walkingReverse"
		kaijuInstance.delayedTime = KAIJU_REVERSE_TIME
	}
} else if (kaijuInstance.kaijuState == "loved") {
	walkSpeed = 0
}

// handle adding obstacles as necessary
kaijuInstance.nextObstacle -= walkSpeed
if (kaijuInstance.nextObstacle <= 0) {
	kaijuInstance.nextObstacle = kaijuInstance.OBSTACLE_DISTANCE

	// show_debug_message(array_length_1d(obstacles))
    canCreate = true
    if (array_length_1d(kaijuInstance.obstacles) > kaijuInstance.currentObstacleIndex) {
        canCreate = !instance_exists(kaijuInstance.obstacles[kaijuInstance.currentObstacleIndex])
    }
    //show_debug_message(@"cancreate:" + string(canCreate))
    if (canCreate) {
		obstacleCount++
		if (obstacleCount == OBSTACLES_BEFORE_KAIJU) {
			kaijuInstance.nextObstacle = kaijuInstance.OBSTACLE_DISTANCE * 3
		}
		if (obstacleCount > OBSTACLES_BEFORE_KAIJU) {
			obstacleCount = 0
	        var obstacle2 = instance_create_layer(1250, 175, "KaijuObs", kaiju2)
			obstacle2.type = "kaiju"
			obstacle2.jumpable = false
			kaijuInstance.obstacles[kaijuInstance.currentObstacleIndex] = obstacle2
		} else {
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
			kaijuInstance.obstacles[kaijuInstance.currentObstacleIndex] = obstacle1
		}
		//show_debug_message(@"creating at:" + string(kaijuInstance.currentObstacleIndex))
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
			&& kaijuInstance.kaijuState != "jumping_down"
			&& kaijuInstance.kaijuState != "stopped"
			&& kaijuInstance.kaijuState != "walkingReverse") {
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
				if (walkSpeed > 0) {	/// don't let it keep crashing if its legs are broken
					kaijuInstance.damage += KAIJU_STOP_DAMAGE
				}
			}
		}

		// handle helicopter
		if (kaijuInstance.obstacles[i].type == "helicopter") {
			var h = kaijuInstance.obstacles[i];
			h.x -= HELI_SPEED; // helicopters always move forward even if it's not walking
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
					bull.dmg = BULLET_DAMAGE
					h.shootTime = SHOOT_TIME
				}
			}
		}
		
		// handle kaiju
		if (kaijuInstance.obstacles[i].type == "kaiju") {
			var kaijuTwo = kaijuInstance.obstacles[i]
			if (kaijuTwo.kaijuState == "walking") {
				if (kaijuTwo.x - kaijuInstance.kaijuMonster.x < LOVE_DISTANCE
					&& kaijuTwo.x - kaijuInstance.kaijuMonster.x > LOVE_DISTANCE - LOVE_DISTANCE_BUFFER) {
						kaijuInstance.kaijuState = "loved"
						kaijuTwo.kaijuState = "loved"
						kaijuTwo.kaijuTalk = irandom(5)
						kaijuTwo.delay = KAIJU_LOVE_DELAY
				}
			} else if (kaijuTwo.kaijuState == "loved") {
				if (kaijuTwo.delay <= 0) {
					kaijuInstance.kaijuState = "walking"
					kaijuTwo.kaijuState = "walking_done"
					switch(kaijuTwo.kaijuTalk) {
						case 0: // heart
							kaijuInstance.heartState = 0
							kaijuInstance.leftArmState = 0
							kaijuInstance.rightArmState = 0
							kaijuInstance.heartState = 0
							kaijuInstance.brainState = 0
							kaijuInstance.leftLegState = 0
							kaijuInstance.rightLegState = 0
						break;
						case 1: // burger
							kaijuInstance.heartState = 0
						break;
						case 2: // smile
							kaijuInstance.brainState = 0
						break;
						case 3: // helicopter_icon
							kaijuInstance.leftArmState = 0
							kaijuInstance.rightArmState = 0
						break;
						case 4: // mad_face
							kaijuInstance.brainState = 1
							kaijuInstance.heartState = 1
						break;
						case 5: // oops_face
							kaijuInstance.leftLegState = 1
							kaijuInstance.rightLegState = 1
						break;
					}
					kaijuTwo.kaijuTalk = -1
				} else {
					kaijuTwo.delay--
				}
			} else if (kaijuTwo.kaijuState == "walking_done") {
				if (walkSpeed == 0) {
					kaijuTwo.x -= WALK_SPEED; // don't stop if you're done
				}
			}
		}
	}
}

if (kaijuInstance.damage >= KAIJU_DAMAGE_BEFORE_INJURY) {
	var healthyLimbs = ds_list_create();
	if (kaijuInstance.heartState == 0) ds_list_add(healthyLimbs, "heartState")
	if (kaijuInstance.brainState == 0) ds_list_add(healthyLimbs, "brainState")
	if (kaijuInstance.leftArmState == 0) ds_list_add(healthyLimbs, "leftArmState")
	if (kaijuInstance.rightArmState == 0) ds_list_add(healthyLimbs, "rightArmState")
	if (kaijuInstance.leftLegState == 0) ds_list_add(healthyLimbs, "leftLegState")
	if (kaijuInstance.rightLegState == 0) ds_list_add(healthyLimbs, "rightLegState")
	var injuredLimb = healthyLimbs[| irandom(ds_list_size(healthyLimbs) - 1)];
	switch (injuredLimb) {
		case "heartState":
			kaijuInstance.heartState = 1
			break;
		case "brainState":
			kaijuInstance.brainState = 1
			break;
		case "leftArmState":
			kaijuInstance.leftArmState = 1
			break;
		case "rightArmState":
			kaijuInstance.rightArmState = 1
			break;
		case "leftLegState":
			kaijuInstance.leftLegState = 1
			break;
		case "rightLegState":
			kaijuInstance.rightLegState = 1
			break;
	}
	kaijuInstance.damage = 0
	show_debug_message("INJURY!")
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
