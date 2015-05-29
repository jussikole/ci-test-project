FROM docker.betterdoctor.com:443/bd-webbase:latest
#RUN useradd -ms /bin/bash jenkins

ADD . /src
WORKDIR src
RUN chmod 700 ./docker_init.sh


ENTRYPOINT ['./docker_init.sh']
