FROM python:3.6-slim
LABEL maintainer="Gaurang Singh" 
COPY ./requirements.txt /app/
WORKDIR /app/
RUN pip install -r requirements.txt
COPY ./app.py /app/
COPY ./iris_trained_model.pkl /app/
ENTRYPOINT ["python", "app.py"]