up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml down --remove-orphans

build:
	docker-compose -f docker-compose.yml up -d --build

rebuild: down build

restart: down up

start: ./setup.sh