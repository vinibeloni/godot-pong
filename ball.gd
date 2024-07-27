extends CharacterBody2D
class_name Ball

@export var SPEED = 100

var direction = Vector2.ZERO
var windows_size

func _ready():
  random_direction()
  windows_size = get_viewport_rect().size

func _physics_process(delta):
  move_and_collide(direction * SPEED * delta)

func reset():
  position.x = windows_size.x / 2
  position.y = randi_range(200, windows_size.y - 200)
  random_direction()

func random_direction():
  direction.x = [1,-1].pick_random()
  direction.y = [1,-1].pick_random()  

func bounce_y():
  direction.y *= -1

func bounce_x():
  direction.x *= -1
