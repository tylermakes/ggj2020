//x += xSpeed
//y += ySpeed
var hitThing = instance_position(x, y, temp_kaiju)
if (hitThing != noone) {
	SHOOT_DAMAGE = 50
	kaijuInstance.damage -= SHOOT_DAMAGE
	instance_destroy()
}