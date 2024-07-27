extends Area2D
class_name Paddle

@export var SPEED = 60

var windows_height: int
var paddle_height: int

func _ready():
  windows_height = get_viewport_rect().size.y
  paddle_height = $ColorRect.get_size().y

func _physics_process(delta):
  #var y = get_axis("ui_down", "ui_up") if name == "Right" else get_axis("ui_down_s", "ui_up_w")

  if name == "Paddle Right":
    if Input.get_action_strength("ui_up"):
      position.y -= SPEED * delta
    if Input.get_action_strength("ui_down"):
      position.y += SPEED * delta

  if name == "Paddle Left":
    if Input.get_action_strength("ui_up_w"):
      position.y -= SPEED * delta
    if Input.get_action_strength("ui_down_s"):
      position.y += SPEED * delta

  position.y = clamp(position.y, paddle_height / 2, windows_height - paddle_height / 2)
  # position.y = y * SPEED * delta
  # move_and_collide(position)

#func get_axis(down, up):
  #return Input.get_action_strength(down) - Input.get_action_strength(up)
