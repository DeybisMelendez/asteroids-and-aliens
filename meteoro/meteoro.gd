extends RigidBody2D

var vel = Vector2()
var movimiento = Vector2()
var rotacion = randi()%8+2
var pos = Vector2()
var velMax = randi()%200+100
var tam = "Grande"
var No = 1
var color = "Cafe"
var colision = false

func _ready():
	movimiento = vel * velMax
	var shape = load("res://meteoro/meteoro" + tam + str(No) + ".tres")
	$CollisionShape2D.set_shape(shape)
	var sprite = load ("res://meteoro/meteoro" + color + tam + str(No) + ".png")
	$Sprite.set_texture(sprite)
	apply_impulse(Vector2(0,0),movimiento)
	set_angular_velocity(rotacion)

func _physics_process(delta):
	pos = global_position
	if pos.x < get_parent().minX:
		global_position.x = get_parent().maxX
		regularVelocidad()
	elif pos.x > get_parent().maxX:
		global_position.x = get_parent().minX
		regularVelocidad()
	if pos.y < get_parent().minY:
		global_position.y = get_parent().maxY
		regularVelocidad()
	elif pos.y > get_parent().maxY:
		global_position.y = get_parent().minY
		regularVelocidad()

func regularVelocidad():
	movimiento = vel * velMax
	set_angular_velocity(rotacion)
	set_linear_velocity(movimiento)