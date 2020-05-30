# Docker MySQL+Nginx+FPM

## DevDependencies:

    Install git
    Install docker
    Install docker-compose
    Install make

## Install:

1. Create file `.env` for prefix.

## Example:

    DOCKER_PREFIX=laravel_project
    DB_DATABASE=laravel_project_db
    DB_PASSWORD=123
    container_php=php-fpm
    container_db=db
    db_password=123
    db_name=laravel_project_db
    container_server=webserver

2. `docker stop $(docker ps -a -q)`: Stop all containers.

3. `make start`: Load docker images and create containers || start containers.

4. `make laravel_install`: Install laravel.

5. `sudo /etc/hosts` set `0.0.0.0 laravel.loc`

6. http://localhost:8098/

## Other commands:

`make connect_app`: Connect to APP container (php-fpm)

`make connect_db`: Connect to DB container (mysql)

`make connect_server`: Connect to container_server container (nginx)

