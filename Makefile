-include ./.make/bootstrap

## ----------------------------------------------------------
## DOCKER
## ----------------------------------------------------------
.PHONY: docker/up docker/down docker/stop docker/up-build docker/restart docker/restart-force docker/status app app/install

docker/up:
	cd docker/; docker-compose up -d;
	make listening

docker/up-build:
	cd docker/; docker-compose up -d --build --remove-orphans;
	make listening

docker/down:
	cd docker/; docker-compose down

docker/stop:
	cd docker/; docker-compose stop

docker/status:
	cd docker/; docker-compose ps

docker/build:
	cd docker/; docker-compose build

docker/restart:
	make docker/stop
	make docker/up

docker/restart-force:
	make docker/down
	make docker/up-build

app:
	docker exec -it ${DOCKER_PHP} bash

app/install:
ifeq (prod, $(APP_ENV))
	make symfony/dmm
else
	make symfony/dsc
endif
