PHP_CONTAINER=php
NODE_CONTAINER=node

init:
	docker-compose up --build -d

up:
	docker-compose up -d

down:
	docker-compose down -v

php:
	docker-compose exec $(PHP_CONTAINER) bash

laravel:
	docker-compose up -d
	docker-compose exec $(PHP_CONTAINER) bash -c "composer install && chmod -R 777 storage && php artisan key:generate"

