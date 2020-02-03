# load Flask 
import pickle
import numpy as np
from flask import Flask, request, jsonify

app = Flask(__name__)

model = None

def load_model():
    global model
    # model variable refers to the global variable
    with open('./Models/iris_trained_model.pkl', 'rb') as f:
        model = pickle.load(f)


# define a predict function as an endpoint 
@app.route("/predict", methods=["GET","POST"])
def predict():
    data = {"success": False}
    if request.method == 'POST':
        params = request.get_json()  # Get data posted as a json
        if (params != None):
            params = np.array(params)[np.newaxis, :]  # converts shape from (4,) to (1, 4)
            prediction = model.predict(params)
            data["response"] = prediction[0]
            data["success"] = True
        print("Respose data", data)
    return str(data)
  
# start the flask app, allow remote connections
if __name__ == '__main__':
    load_model()  # load model at the beginning once only
    app.run(host='0.0.0.0', port=8080)
