extends Node2D
class_name Game

var BALL = preload("res://ball.tscn")

var paddles = {
  "left": 0,
  "right": 0
}

@onready var leftScore = $Score/Left
@onready var rightScore = $Score/Right

func _add_point(paddle_name, body, score):
  body.queue_free() # TODO: fix deffer
  paddles[paddle_name] = paddles[paddle_name] + 1
  score.text = str(paddles[paddle_name])

  var ball = BALL.instantiate()
  ball.global_position = Vector2(160, 90)
  add_child(ball)

# Borders
func _on_top_body_entered(body):
  body.bounce()

func _on_bottom_body_entered(body):
  body.bounce()

func _on_left_body_entered(body):
  _add_point("right", body, rightScore)

func _on_right_body_entered(body):
  _add_point("left", body, leftScore)
