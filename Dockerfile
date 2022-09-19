FROM nginx:alpine

RUN rm -f /etc/nginx/conf.d/*
COPY ./nginx.conf /etc/nginx/conf.d/home-site.conf
COPY . /usr/share/nginx/html

EXPOSE 80