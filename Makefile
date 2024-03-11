DOCKER_COMPOSE = sudo docker-compose -f srcs/docker-compose.yml

all: up

prepare:
	@mkdir -p /home/${USER}/data/mariadb
	@mkdir -p /home/hucorrei/data/wordpress

build:
	@$(DOCKER_COMPOSE) build

up: prepare build
	@$(DOCKER_COMPOSE) up -d

down:
	@$(DOCKER_COMPOSE) down

fclean:
	@echo "Stopping all running containers"
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@echo "Removing all containers"
	@docker rm $$(docker ps -qa) 2>/dev/null || true
	@echo "Removing all Docker images"
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@echo "Removing all Docker volumes"
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@echo "Removing all Docker networks"
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@echo "Cleaning up Docker system (including images, containers, volumes, and networks)"
	@docker system prune -a --volume 2>/dev/null || true
	@echo "Forcing Docker system cleanup"
	@docker system prune -a --force 2>/dev/null || true
	@echo "Removing directory /home/hucorrei/data"
	@sudo rm -rf /home/hucorrei/data 2>/dev/null || true

.PHONY: all prepare build up fclean down


# connect to maria db
# docker exec -it mariadb mysql -u root -p
# show databases;