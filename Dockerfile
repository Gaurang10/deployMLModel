# FROM ubuntu:latest
# LABEL maintainer="Gaurang Singh" 
# RUN apt-get update \  
#   && apt-get install -y python3-pip python3-dev \  
#   && cd /usr/local/bin \  
#   && ln -s /usr/bin/python3 python \  
#   && pip3 install flask  
  
# COPY app.py app.py 
# ENTRYPOINT ["python3","app.py"]

FROM python:3.6-slim
LABEL maintainer="Gaurang Singh" 
COPY ./requirements.txt /app/
WORKDIR /app/
RUN pip install -r requirements.txt
COPY ./app.py /app/
COPY ./iris_trained_model.pkl /app/
ENTRYPOINT ["python", "app.py"]