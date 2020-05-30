include .env

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

connect_app: #Connect to APP container
	docker-compose exec $(container_php) bash

connect_db: #Connect to DB container
	docker-compose exec $(container_db) bash

connect_server: #Connect to container_server container
	docker-compose exec $(container_server) /bin/sh

backup_db:
	docker exec $(container_db) /usr/bin/mysqldump -u root --password=$(db_password) $(db_name) > ./docker/var/mysql/backup.sql

restore_db:
	cat ./docker/var/mysql/backup.sql | docker exec -i $(container_db) /usr/bin/mysql -u root --password=$(db_password) $(db_name)