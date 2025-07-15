extends Node2D
# This script extends the Node2D class / Este script herda da classe Node2D

var sprite1 = null
# Placeholder for a texture to be loaded later / Espaço reservado para uma textura a ser carregada depois

var loaded1 = false
var loaded2 = false
# Flags to check if assets are loaded or not / Variáveis booleanas para verificar se os recursos estão carregados ou não

# Called when the node enters the scene tree for the first time.
# Chamado quando o nó entra na árvore de cena pela primeira vez
func _ready():
	pass
	# Placeholder function body / Corpo da função vazio

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Chamado a cada frame. 'delta' é o tempo decorrido desde o último frame
func _process(delta):

	# Only load sprite1 if not loaded yet and player is near / Só carrega o sprite1 se ainda não tiver carregado e o jogador estiver próximo
	if !loaded1:
		if abs($char1.global_position.x - $player.global_position.x) < 500:
			sprite1 = load("res://assets/pequenoArquivo.png")
			# Load a static image for char1 / Carrega uma imagem estática para o char1
			$char1/Sprite2D.texture = sprite1
			# Apply the texture to char1's Sprite2D / Aplica a textura no Sprite2D do char1
			loaded1 = true
			# Set loaded flag to true / Define a flag como verdadeira
			print("Carreguei")
			# Print "loaded" message / Exibe a mensagem "Carreguei"
	
	# If sprite1 is loaded but player moved away, unload it / Se o sprite1 estiver carregado mas o jogador se afastou, descarrega
	elif loaded1 and abs($char1.global_position.x - $player.global_position.x) > 500:
		sprite1 = null
		# Remove reference to texture / Remove a referência da textura
		$char1/Sprite2D.texture = null
		# Remove texture from Sprite2D / Remove a textura do Sprite2D
		loaded1 = false
		# Set flag back to false / Define a flag como falsa
		print("Descarreguei")
		# Print "unloaded" message / Exibe a mensagem "Descarreguei"

	# Repeat similar logic for char2, but with animated sprite / Repete a lógica para o char2, mas com sprite animado
	if !loaded2:
		if abs($char2.global_position.x - $player.global_position.x) < 500:
			var frames = SpriteFrames.new()
			# Create a new SpriteFrames resource / Cria um novo recurso SpriteFrames
			frames.add_animation("idle")
			# Add an "idle" animation / Adiciona uma animação "idle"
			frames.set_animation_speed("idle", 20)
			# Set animation speed to 20 FPS / Define a velocidade da animação como 20 FPS
			frames.set_animation_loop("idle", true)
			# Set animation to loop / Define que a animação deve repetir

			for i in range(24):
				# Loop through 24 frames / Loop para 24 quadros
				var texture = load("res://Assets/Não falando_%04d.png" % i)
				# Load each frame with zero-padded name / Carrega cada frame com nome formatado com zeros à esquerda
				frames.add_frame("idle", texture)
				# Add frame to "idle" animation / Adiciona o frame à animação "idle"

			$char2/AnimatedSprite2D.frames = frames
			# Assign frames to AnimatedSprite2D / Atribui os frames ao AnimatedSprite2D
			$char2/AnimatedSprite2D.play("idle")
			# Play the "idle" animation / Toca a animação "idle"
			loaded2 = true
			# Set loaded flag / Define a flag como verdadeira
			print("Carreguei")
			# Print message / Imprime mensagem
	
	# Unload animation if player moves away / Descarrega a animação se o jogador se afastar
	elif loaded2 and abs($char2.global_position.x - $player.global_position.x) > 500:
		$char2/AnimatedSprite2D.frames = SpriteFrames.new()
		# Clear frames from AnimatedSprite2D / Limpa os frames do AnimatedSprite2D
		loaded2 = false
		# Reset flag / Reinicia a flag
		print("Descarreguei")
		# Print message / Imprime mensagem
