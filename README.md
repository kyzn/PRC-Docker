# Dockerfile for Pull Request Club

To see built image, visit [Docker Hub](https://hub.docker.com/r/kyzn/prc/).

Following instructions can be used to deploy [PullRequest.Club](https://github.com/kyzn/PRC) in near future. Note that this is till a work in progress.

## Instructions

Run for testing at port 3000

    sudo docker run --name=prc -it --rm -p 3000:8080 -e CLIENT_ID=xxxx -e CLIENT_SECRET=yyyy kyzn/prc

Go into bash, for testing. You will need to manually start memcached

    sudo docker run --name=prc -it --rm -p 3000:8080 -e CLIENT_ID=xxxx -e CLIENT_SECRET=yyyy kyzn/prc bash
    service memcached start

Run at deployment at port 80

    sudo docker run 80:8080 -e CLIENT_ID=xxx CLIENT_SECRET=yyy kyzn/prc


## Cheatsheet

Build by hand

    sudo docker build -t kyzn/prc .

If "git clone" doesn't bring the latest, then skip cache

    sudo docker build --no-cache -t kyzn/prc .

Kill running containers

    sudo docker kill `sudo docker ps -q`

Amazing blog

    https://robn.io/docker-perl/
