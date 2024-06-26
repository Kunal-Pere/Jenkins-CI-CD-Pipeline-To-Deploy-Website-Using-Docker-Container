
FROM nginx

WORKDIR /app

COPY index.html /usr/share/nginx/html/index.html

RUN sudo apt update

