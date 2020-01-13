# deployMLModel as a webservice

Serving Machine Leaning model as a REST API with Flask and docker. 


Step 1: Create python virtual enviroment. 
```
sudo pip3 install virtualenv 
virtualenv venv
source venv/bin/activate 
```

Step 2: Install dependancies. 
```
pip install -r requirements.txt
```

Step 3: Start the server. It will start the server on your machine's IP and 8080 port. 
```
python app.py
```
Step 4: Test you API.
```
curl -X POST 0.0.0.0:8080/predict -H 'Content-Type: application/json' -d '[5.9,3.0,5.1,1.8]'
{'success': True, 'response': 2}
```



If want to package this into a docker image then follow below steps.

* Build a docker images.
```
docker image build -t "deploy_ml_app" .
```

* Run the docker as service in backgroup.
```
docker run -d -p 8080:8080 deploy_ml_app .
docker ps
```
