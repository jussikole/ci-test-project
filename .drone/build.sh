#!/bin/bash
set -e

REGISTRY="docker.betterdoctor.com:443"
IMAGE="ci-test-project"
DOMAIN="github.com"
OWNER="jussikole"
PROJECT="ci-test-project"

cd /var/cache/drone/src/$DOMAIN/$OWNER/$PROJECT

bundle install
bundle exec rspec
wrapdocker

until docker info >/dev/null 2>&1; do
	echo "Waiting for internal docker.."
	sleep 5
done

echo "lol"
docker-build -t $REGISTRY/$IMAGE .

# Restart docker
start-stop-daemon --stop --pidfile "/var/run/docker.pid"