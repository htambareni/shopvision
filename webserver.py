import requests
import json
url = ("http://127.0.0.1:5000/score")
data = {'hello': 'world'}
# data = json.load(data)
r = requests.get(url)
print(r.status_code)
print(r.json())