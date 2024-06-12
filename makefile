up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml down --remove-orphans

build:
	docker-compose -f docker-compose.yml up -d --build

rebuild: down build

restart: down up

dev:	
	@BUILDKIT_PROGRESS=plain docker compose --profile=dev --env-file=application/.env up --build -d --remove-orphans

init:
	@sh ./setup.sh