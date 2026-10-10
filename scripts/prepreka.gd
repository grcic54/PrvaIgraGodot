class_name Prepreka
extends Area2D


@export var steta: int = 25

func _ready() -> void:
	body_entered.connect(_na_ulazak_tijela)

func _na_ulazak_tijela(tijelo: Node2D) -> void:
	if tijelo is Igrac:
		pokupi(tijelo)
		

func pokupi(igrac: Igrac) -> void:
	igrac.primi_stetu(steta)
	print(name, ": Primljena steta:", steta)
