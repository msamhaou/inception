FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install mariadb-server -y
EXPOSE 3306
COPY script.sh script.sh
RUN chmod +x script.sh
CMD [ "bash", "script.sh" ]