extends Node

func _ready():
	DiscordRPC.app_id = 1296247492815622285
	DiscordRPC.details = "Level : House"
	DiscordRPC.state = "Searching for flerbert."
	DiscordRPC.large_image = "house"
	DiscordRPC.small_image = "flerbert"
	
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	
	DiscordRPC.refresh()
