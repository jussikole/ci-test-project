#!/bin/bash
set -e

. ./config.sh

cd /var/cache/drone/src/$DOMAIN/$OWNER/$PROJECT

bundle exec rspec

wrapdocker

until docker info >/dev/null 2>&1; do
	echo "Waiting for internal docker.."
	sleep 5
done

docker-build -t $REGISTRY/$IMAGE .

# Restart docker
start-stop-daemon --stop --pidfile "/var/run/docker.pid"