FROM docker.betterdoctor.com:443/bd-webbase:latest


ADD . /src
WORKDIR src

ENTRYPOINT ['./docker_init.sh']
