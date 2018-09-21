extends KinematicBody2D

var rotacion = 0.0
var aceleracion = 10
var velocidadMax = 100
var velocidadGiro = 100
var movimiento = Vector2()
var bala = preload ("res://laser/bala.tscn")
var skin = "res://jugador/" + str(general.skinNave) + ".png"
var nave = load(skin)
var morir = false
var pos = Vector2()

func _ready():
	$Sprite.set_texture(nave)
	

func _physics_process(delta):
	if !morir:
		
		rotation_degrees = rotacion
		movimiento.x = clamp (movimiento.x,-velocidadMax,velocidadMax)
		movimiento.y = clamp (movimiento.y,-velocidadMax,velocidadMax)
		movimiento = move_and_slide(movimiento)
		
		if Input.is_action_pressed("movIzq"):
			movimiento.x -= aceleracion * delta
			rotacion -= deg2rad(velocidadGiro)
		elif Input.is_action_pressed("movDer"):
			movimiento.x += aceleracion * delta
			rotacion += deg2rad(velocidadGiro)
		if Input.is_action_pressed("movArr"):
			movimiento.y -= aceleracion * delta
		elif Input.is_action_pressed("movAba"):
			movimiento.y += aceleracion * delta
		
		if Input.is_action_just_pressed("disparar"):
			var nuevaBala = bala.instance()
			nuevaBala.global_position = $Position2D.global_position
			nuevaBala.angulo = rotacion
			get_parent().add_child(nuevaBala)
		
		if get_slide_count() > 0:
			var colision = get_slide_collision(get_slide_count()-1).collider
			if colision.is_in_group("enemigo"):
				morir = true
				get_parent().final()
				hide()

