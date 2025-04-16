extends State
class_name EnemyAttack

# Called when the node enters the scene tree for the first time.
@onready var enemy: CharacterBody3D = get_parent().get_parent()
var player: CharacterBody3D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	
	if enemy.global_position.distance_to(player.global_position) > enemy.AttackReach:
		emit_signal("Transitioned", self, "EnemyChase")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta: float) -> void:
	player.health_component.damage(enemy.basic_attack)
	if enemy.global_position.distance_to(player.global_position) > enemy.AttackReach:
		emit_signal("Transitioned", self, "EnemyChase")
