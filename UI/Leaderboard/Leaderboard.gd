extends ScrollContainer

export (PackedScene) var ScoreEntry

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#$VBoxContainer/HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$VBoxContainer/HTTPRequest.request("https://cqdzwos026.execute-api.eu-west-1.amazonaws.com/items")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	
	$VBoxContainer/HTTPRequest.request("https://cqdzwos026.execute-api.eu-west-1.amazonaws.com/items", ["Content-Type: application/json"], false, 3, JSON.print({"id":str(OS.get_unix_time())+","+str(randi()),"price":13,"name":"hahaha"}))
	#$VBoxContainer/HTTPRequest.request("https://cqdzwos026.execute-api.eu-west-1.amazonaws.com/items", ["Content-Type: application/json"], false, 3, JSON.print({"id":"22","price":12,"name":"hahaha"}))

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	
	var json = JSON.parse(body.get_string_from_utf8())
	
	for elt in json.result["Items"]:
		
		var entry = ScoreEntry.instance()
		entry.text = "Player %s" % elt
		$VBoxContainer.add_child(entry)
		
		print(elt)
	print(json.result)
