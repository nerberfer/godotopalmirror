extends State
class_name EnemyChase

@onready var enemy: CharacterBody3D = get_parent().get_parent()
var player: CharacterBody3D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func process(delta: float):
	enemy.nav.set_target_position(player.global_position)
	
	if enemy.global_position.distance_to(player.global_position) > enemy.ChaseDistance:
		emit_signal("Transitioned", self, "EnemyWander")
		
	if enemy.global_position.distance_to(player.global_position) < enemy.AttackReach:
		emit_signal("Transitioned", self, "EnemyAttack")

func physics_process(delta: float) -> void:
	if enemy.nav.is_navigation_finished():
		return
	
	var next_position: Vector3 = enemy.nav.get_next_path_position()
	enemy.velocity = enemy.global_position.direction_to(next_position) * enemy.RunSpeed
