FROM nginx:stable-alpine3.20

COPY ./app /usr/share/nginx/html

EXPOSE 80