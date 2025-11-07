FROM python:3.10-slim

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y ffmpeg aria2 gcc libffi-dev musl-dev && \
    pip install --no-cache-dir -r requirements.txt
RUN python3 modules/main.py


