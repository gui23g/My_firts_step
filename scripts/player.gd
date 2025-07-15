# Simple way to move your character / Maneira simples de movimentar seu personagem
extends Node2D

# Instantiate the sprite in a variable / Instanciando o sprite em uma variável
@onready var sprite = $Player

# Setting the player's speed / Estabelecendo a velocidade do jogador
var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Condition to move to the right / Condição para movimentar para a direita
	if Input.is_action_pressed("right"):
		position.x += speed
	# Condition to move to the left / Condição para movimentar para a esquerda
	if Input.is_action_pressed("left"):
		position.x -= speed
	# Condition to move down / Condição para movimentar para baixo
	if Input.is_action_pressed("down"):
		position.y += speed
	# Condition to move up / Condição para movimentar para cima
	if Input.is_action_pressed("up"):
		position.y -= speed
