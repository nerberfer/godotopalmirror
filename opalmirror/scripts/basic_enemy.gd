extends CharacterBody3D

@onready var nav = $NavigationAgent3D
<<<<<<< Updated upstream
var speed = 1.5
var AttackReach = 1.5
=======
@export var speed: float = 1.5
@export var AttackReach: float = 3
>>>>>>> Stashed changes
var gravity = 9.8
var player: CharacterBody3D = null

var player: CharacterBody3D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]
<<<<<<< Updated upstream


=======
	
>>>>>>> Stashed changes
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Defines how enemy moves towards player
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y -= 2
		var next_location = nav.get_next_path_position()
		var current_location = global_transform.origin
		var new_velocity = (next_location - current_location).normalized() * speed
	
		velocity = velocity.move_toward(new_velocity, 0.25)
	move_and_slide()
	
<<<<<<< Updated upstream
	if global_position.distance_to(player.global_position) < AttackReach:
			var attack: Attack = Attack.new(1.0, self)
			player.health_component.damage(attack)

func target_position(target):
	nav.target_position = target
	look_at(target,Vector3.UP,true)

=======
	#Attack player if close enough
	if global_position.distance_to(player.global_position) < AttackReach:
		var attack: Attack = Attack.new(1.0, self)
		player.health_component.damage(attack)
	
func target_position(target):
	nav.target_position = target
	look_at(target,Vector3.UP,true)
	
>>>>>>> Stashed changes
func on_death() -> void:
	queue_free()
