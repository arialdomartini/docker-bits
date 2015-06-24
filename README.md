# docker-bits
Playing with Docker

## Run an interactive container
    docker run --name=interactive -t -u mono /bin/bash

## Run and monitor a daemonized container
    docker run --name=daemonized -d mono /bin/bash -c "while true; do echo running; sleep 1; done"
    docker logs -tf daemonized
    docker exec -t i deamonized /bin/bash
    docker exec daemonized touch newfile

## General control commands
    docker ps -a
    docker start #ID#
    docker attach #ID#
    docker stop #ID#

## Remove all containers
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)


