container_php = php-fpm
container_db = db
container_server = webserver

#############################################
###                                       ###
###   Do not convert tab's to spaces      ###
###                                       ###
#############################################

laravel_install: #Create new Laravel project
	docker-compose exec $(container_php) composer create-project --prefer-dist laravel/laravel

ownership: #Set ownership
	sudo chown $(USER):$(USER) . -R

#####################################
###                               ###
###       Work in containers      ###
###                               ###
#####################################

start: #start docker containers
	docker-compose up --build -d

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