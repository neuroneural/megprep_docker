# Use the NeuroDebian base image from DockerHub
FROM neurodebian

# Set the working directory (you can customize this as needed)
WORKDIR /app

FROM python:3.9


COPY requirements.txt .

RUN pip install -r requirements.txt

