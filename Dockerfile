FROM nginx:alpine

COPY ./0hh1/ /usr/share/nginx/html/

EXPOSE 80