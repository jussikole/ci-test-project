FROM ruby:2.2.1

ENV URL_WRAPDOCKER https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker

RUN apt-get update && \
	apt-get install -y apparmor && \
	curl -s https://get.docker.io/ubuntu/ | sudo sh && \
	wget -O /usr/local/bin/wrapdocker $URL_WRAPDOCKER && \
	chmod +x /usr/local/bin/wrapdocker