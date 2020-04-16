container_php = php-fpm
container_db = db
container_server = webserver

#############################################
###                                       ###
###   Do not convert tab's to spaces      ###
###                                       ###
#############################################

composer_dep: #install composer dependency >> ./vendors
	docker run --rm -v $(CURDIR):/app composer install

laravel_install: #Create new Laravel project
	docker-compose exec $(container_php) composer create-project --prefer-dist laravel/laravel src

key: #generate APP key
	docker-compose exec $(container_php) php artisan key:generate

ownership: #Set ownership
	sudo chown $(USER):$(USER) . -R

#####################################
###                               ###
###       Work in containers      ###
###                               ###
#####################################

start: #start docker containers @docker-compose up -d
	docker-compose up -d

stop: #stop docker containers
	docker-compose down -v

show: #show docker's containers
	docker ps

connect_app: #Connect to APP container
	docker-compose exec $(container_php) bash

connect_db: #Connect to DB container
	docker-compose exec $(container_db) bash

connect_server: #Connect to container_server container
	docker-compose exec $(container_server) /bin/sh