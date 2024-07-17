all:
	sudo mkdir -p /home/msamhaou/data
	docker compose up --build -d
stop:
	docker container ls -q  | xargs docker container stop

clean_c:
	docker container ls -aq  | xargs docker container rm -f
clean_i:
	docker image ls -aq  | xargs docker image rm -f
clean_v: 
	docker volume ls -q  | xargs docker volume rm -f
	sudo rm -rf /home/msamhaou/data
clean_n:
	docker network ls -q | xargs docker network rm -f

re : clean_c clean_i all
