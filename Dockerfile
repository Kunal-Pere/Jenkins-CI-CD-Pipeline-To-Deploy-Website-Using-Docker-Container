
FROM nginx:latest

WORKDIR /app

COPY . .

RUN sudo apt update

