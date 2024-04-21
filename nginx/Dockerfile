FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install nginx -y
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/wordpress
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]