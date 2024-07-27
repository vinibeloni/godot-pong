extends Node2D
class_name Main

const LEFT_SCORE = 0
const RIGHT_SCORE = 1

@onready var score_left = $"Score Left"
@onready var score_right = $"Score Right"

var scores = [0,0]

func _on_borders_body_entered(ball):
  ball.bounce_y()

func _on_paddle_left_body_entered(ball):
  ball.bounce_x()

func _on_paddle_right_body_entered(ball):
  ball.bounce_x()

func _on_left_body_entered(ball):
  set_score(RIGHT_SCORE, ball)

func _on_right_body_entered(ball):
  set_score(LEFT_SCORE, ball)

func set_score(i, ball):
  ball.reset()
  scores[i] = scores[i] + 1
  
  if i == LEFT_SCORE:
    score_left.text = str(scores[i])
  else:
    score_right.text = str(scores[i])
  
  
