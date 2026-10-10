class_name Predmet
extends Area2D


@export var vrijednost: int = 1

func _ready() -> void:
	body_entered.connect(_na_ulazak_tijela)

func _na_ulazak_tijela(tijelo: Node2D) -> void:
	if tijelo is Igrac:
		pokupi(tijelo)
		

func pokupi(igrac: Igrac) -> void:
	igrac.dodaj_bodove(vrijednost)
	print(name, ": pokupljen, vrijednost: ", vrijednost)
	queue_free()
	
