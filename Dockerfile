FROM nginx:alpine

RUN rm -f /etc/nginx/conf.d/*
COPY --from=builder ./nginx.conf /etc/nginx/conf.d/home-site.conf
COPY --from=builder . /usr/share/nginx/html

EXPOSE 80