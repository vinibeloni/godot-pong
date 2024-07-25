extends CharacterBody2D
class_name Ball

@export var SPEED = 100

var direction = Vector2.ZERO

func _ready():
  direction.x = [1,-1].pick_random()
  direction.y = [1,-1].pick_random()

func _physics_process(delta):
  velocity = direction * SPEED * delta
  move_and_collide(velocity)

func bounce():
  direction.y *= -1
