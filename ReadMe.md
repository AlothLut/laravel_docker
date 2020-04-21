# Docker MySQL+Nginx+FPM

## DevDependencies:

    Install git
    Install docker
    Install docker-compose
    Install make

## Install:

1. Create file `.env` for prefix.
    Example:

    DOCKER_PREFIX=laravel_project
    DB_DATABASE=laravel_project_db
    DB_PASSWORD=123

2. `docker stop $(docker ps -a -q)`: Stop all containers.

3. `make start`: Load docker images and create containers || start containers.

4. `make laravel_install`: Install laravel.

5. `sudo /etc/hosts` write `0.0.0.0 laravel.loc`

6. (http://localhost:8098/)

## Other commands:

`make ownership`: Set ownership

`make stop`: Stop local container

`make show`: Show all started containers.

