from flask import Flask
import requests
app = Flask(__name__)

@app.route('/')
def zelenograd_weather():
	res = requests.get("http://api.openweathermap.org/data/2.5/weather?q=Zelenograd,ru&units=metric&lang=ru&APPID=0ab666b3847fa12aa1e00854f4e11aaa")
	data = res.json()
	temp = str(data['main']['temp'])
	output_block = "<b>Current temperature in Zelenograd is: " + temp + "</b>"
	return output_block
