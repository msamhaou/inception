FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install curl php-mysql php-fpm -y
EXPOSE 9000
COPY script.sh script.sh
RUN chmod +x script.sh && mkdir -p /var/www/wordpress
CMD ["bash", "script.sh"]