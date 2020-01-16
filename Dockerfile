FROM python:3.6-slim
LABEL maintainer="Gaurang Singh" 
COPY ./requirements.txt /app/
WORKDIR /app/
RUN pip install -r requirements.txt
COPY ./app.py /app/
ENTRYPOINT ["python", "app.py"]