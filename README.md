# docker-nginx-for-nexus
Docker container with nginx to forward requests to a nexus docker registry on another port. Copied and adapted the nginx settings from https://github.com/stolho/docker-nexus-nginx.

## Usage

Run image with default values (forwards requests to hostname nexus, web requests to port 8081 and docker requests to 5000):

    docker run -it --rm alukas/docker-nginx-for-nexus

Manually specify nexus hostname, port for nexus web application and docker registry:

    docker run -it --rm -e NEXUS_HOST='nexus-hostname' -e NEXUS_WEB_PORT='8088' -e NEXUS_DOCKER_PORT='9999' alukas/docker-nginx-for-nexus

## Docker Hub

Available as automated build on docker hub: https://hub.docker.com/r/alukas/docker-nginx-for-nexus/