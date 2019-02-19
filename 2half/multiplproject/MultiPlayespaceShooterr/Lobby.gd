extends Node

func _ready():
	pass
	


func _on_HostButton_pressed():
	ConnectionManager.on_host_game()

func _on_joinButton_pressed():
	var ip = $HostRect/joinRect/IPadress.text
	ConnectionManager.on_join_game(ip)
