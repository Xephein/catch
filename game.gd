extends Node2D


var score : float = 0
var timescale = 1
var score_increment = 1
var start_time = 3

@onready var label = $Score
@onready var timer = $Timer
@onready var click_cd = $ClickCD

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(score)
	timer.text = str(0)
	pass # Replace with function body.

func pause():
	if Input.is_action_pressed("esc"):
		get_tree().change_scene_to_file("res://main_menu.tscn")

func update_score():
	label.text = str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_score()
	timer.text = str(click_cd.time_left)
	pause()
	


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and click_cd.time_left == 0:
				score += score_increment
				label.text = str(score)
				click_cd.start(start_time * timescale)


func _on_throw_b_pressed() -> void:
	if score >= 10:
		score_increment += 1
		score -= 10
		
		
func _on_dog_b_pressed() -> void:
	if score >= 5:
		timescale *= 0.99
		score -= 5

func _on_point_b_pressed() -> void:
	if score >= 50:
		score_increment *= 1.25
		score -= 50
