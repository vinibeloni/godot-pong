extends CharacterBody2D
class_name Paddle

@export var SPEED = 60

func _physics_process(delta):
  var y = get_axis("ui_down", "ui_up") if name == "Right" else get_axis("ui_down_s", "ui_up_w")
  
  velocity.y = y * SPEED * delta
  move_and_collide(velocity)
  
func get_axis(down, up):
  return Input.get_action_strength(down) - Input.get_action_strength(up)

func _on_area_2d_body_entered(ball):
  ball.bounce()
