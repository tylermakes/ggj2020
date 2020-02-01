kaijuInstance = instance_create_layer(0, 0, "Instances", kaiju)
p1Map = instance_create_layer(0, 400, "Instances", body_map)
matchThreePuzzle = instance_create_layer(0, 400, "PuzzleInstances", match_three_puzzle)
p1Map.kaijuInstance = kaijuInstance