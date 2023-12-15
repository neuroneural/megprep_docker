# Use the NeuroDebian base image from DockerHub
FROM neurodebian

# Set the working directory (you can customize this as needed)
WORKDIR /app

FROM python:3.9

COPY zickle.py  .
COPY requirements.txt .
COPY MEG_preprocessing.py . 
COPY runner.sh /main.sh

RUN pip install -r requirements.txt

