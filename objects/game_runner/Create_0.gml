kaijuInstance = instance_create_layer(0, 0, "Instances", kaiju)
panelInsance = instance_create_layer(0, 360, "PanelInstances", panel)
p1Map = instance_create_layer(0, 400, "Instances", body_map)
p1Map.kaijuInstance = kaijuInstance

p1Mode = "body"

OBSTACLES_BEFORE_KAIJU = 2
obstacleCount = 15

WALK_SPEED = 4
JUMP_SPEED = 4
BULLET_SPEED = 16
BULLET_DAMAGE = 5
HELI_SPEED = 5
backgroundWidth = sprite_get_width(background_spr)
KAIJU_JUMP_DISTANCE = 200 // distance from which the kaiju will jump if it can
KAIJU_JUMP_DISTANCE_BUFFER = 40 // buffer distance in which the kaiju can jump (otherwise it's too close)
KAIJU_STOP_DISTANCE_BUFFER = 20 // buffer distance in which the kaiju can be stopped (otherwise it's past the building)
KAIJU_STOP_DISTANCE = 120 // distance at which the kaiju will run into a building and stop
KAIJU_SHOOT_DISTANCE_BUFFER = 400 // buffer distance in which the kaiju can be shot (otherwise it's gone past)
KAIJU_SHOOT_DISTANCE = 700 // distance at which the kaiju will get shot
KAIJU_JUMP_TIME = 50	// how long the kaiju will go up and down when it jumps
KAIJU_STOP_TIME = 30	// how long the kaiju will stop before trying to reverse
KAIJU_REVERSE_TIME = 30	// how long the kaiju will go in reverse before going forward again
KAIJU_DAMAGE_BEFORE_INJURY = 30	// amount of damage kaiju can take before a limb gets injured
KAIJU_STOP_DAMAGE = 10	// damage kaiju takes from running into a building
BUILDING_HEIGHT = 330 // the lowest height where the building should be
BUILDING_RANGE = 50 // the range above BUILDING_HEIGHT that the building can be in
HELI_HEIGHT = 200 // the lowest height the helicopter should be
HELI_RANGE = 200 // the range above HELI_HEIGHT that the building can be in
SHOOT_TIME = 16
OBSTACLE_DISTANCE = 400 // distance between obstacles

LOVE_DISTANCE = 400
LOVE_DISTANCE_BUFFER = 60
KAIJU_LOVE_DELAY = 50