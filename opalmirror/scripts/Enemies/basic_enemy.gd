extends CharacterBody3D

@onready var nav = $NavigationAgent3D

@export var WalkSpeed: float = 1.5
@export var RunSpeed: float = 3.0
@export var AttackReach: float = 1.2
@export var ChaseDistance: float = 10.0

var basic_attack: Attack = Attack.new(0.5, self)

var player: CharacterBody3D = null

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]

func _process(delta: float) -> void:
	nav.set_target_position(player.global_position)
	
	look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z))

func _physics_process(delta: float) -> void:
	move_and_slide()

func on_death() -> void:
	queue_free()
