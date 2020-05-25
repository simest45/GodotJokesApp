extends Button


func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_JokeButton_pressed():
	$HTTPRequest.request("https://www.icanhazdadjoke.com/", ["user-agent: GoDotJokes -gitpending" , "Accept: application/json" ])

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result["joke"])
	get_parent().get_node("JokeLabel").text = json.result["joke"]


