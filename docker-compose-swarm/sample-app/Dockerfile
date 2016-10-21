FROM python:latest
MAINTAINER Arialdo Martini "arialdomartini@gmail.com"
#RUN apt-get update -y
#RUN apt-get install -y python-pip python-dev build-essential
COPY ./app /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python", "app.py"]
