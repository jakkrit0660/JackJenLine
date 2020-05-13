FROM nginx:alpine

RUN mkdir ./game && mkdir ./game/0hh1

COPY ./0hh1 ./game/0hh1
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
