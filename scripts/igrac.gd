class_name Igrac
extends CharacterBody2D

var bodovi: int = 0

@export var gravitacija: float = 900.0
@export var brzina: float = 300.0
@export var ubrzanje: float = 1500.0
@export var trenje: float = 1200.0
@export var br_skok: int = 2 #ukupno skokova
@export var zdravlje: int = 100
var tr_skok = br_skok #trenutni broj = ukupan 

var slika: AnimatedSprite2D #izvor: https://www.youtube.com/watch?v=UKlHiMYNRWQ



func _init() -> void:
	print("Igrac: _init")
	
	
func _ready() -> void:
	slika = $AnimatedSprite2D
	bodovi = 0
	print("Igrac: _ready, brzina: ", brzina)

func _physics_process(delta: float) -> void:
	
	
	if not is_on_floor():
		velocity.y += gravitacija * delta
	
	if is_on_floor(): 
		tr_skok = br_skok
		
	
	if Input.is_action_pressed("desno"):
		velocity.x += ubrzanje * delta
		#slika.flip_h = false
		
		
	elif Input.is_action_pressed("lijevo"):
		velocity.x -= ubrzanje * delta
		#slika.flip_h = true
		
	else:
		velocity.x=move_toward(velocity.x,0.0,trenje*delta)
	
	if Input.is_action_just_pressed("gore") && tr_skok > 0:
		velocity.y = -500
		tr_skok -= 1
		
	
	if Input.is_action_just_pressed("dolje"):
		velocity.y = 500
	
	
	move_and_slide()


func _na_ulazak_tijela(tijelo: Node2D) -> void:
	if tijelo is Prepreka:
		queue_free()


func smrt() -> void: 
		queue_free()
		print("Igra gotova!")
	

func dodaj_bodove(iznos: int) -> void:
	bodovi += iznos
	print("Igrac: bodova (", bodovi, ")") 

func primi_stetu(steta: int) -> void:
	zdravlje -= steta
	print("Ukupno zdravlje: ", zdravlje)
	if zdravlje <= 50:
		slika.frame=1
	if zdravlje <= 0:
		smrt()
