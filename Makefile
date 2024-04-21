all:
	sudo mkdir -p /home/msamhaou/wp
	docker-compose up --build -d
clean_c:
	docker container ls -aq  | xargs docker container rm -f
clean_i:
	docker image ls -aq  | xargs docker image rm -f
clean_v: clean_c
	docker volume ls -q  | xargs docker volume rm -f
	sudo rm -rf /home/msamhaou/wp