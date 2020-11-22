from flask import Flask
from flask_restful import Resource, Api, reqparse
import os
import json
import serial
dev = serial.Serial('COM4', 9600)
data = []
for _ in range(10):
    dev.write(b'2')
    line = dev.readline()
    data.append(line)
app = Flask(__name__, static_folder='./build', static_url_path='/')
api = Api(app)
class Initialize(Resource):
  def put(self):
      return {'data': json.load(data)}, 200
api.add_resource(Initialize, '/api/init/')
if __name__ == "__main__":
    api.run(host='0.0.0.0', debug=False, port=os.environ.get('PORT', 80))