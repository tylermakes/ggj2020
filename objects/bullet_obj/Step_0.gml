//x += xSpeed
//y += ySpeed
var hitThing = instance_position(x, y, temp_kaiju)
if (hitThing != noone) {
	kaijuInstance.damage += dmg
	instance_destroy()
}