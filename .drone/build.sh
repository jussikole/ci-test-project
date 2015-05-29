#!/bin/bash
set -e

REGISTRY="docker.betterdoctor.com:443"
IMAGE="ci-test-project"
DOMAIN="github.com"
OWNER="jussikole"
PROJECT="ci-test-project"

# Make rvm available
source /etc/profile.d/rvm.sh

cd /var/cache/drone/src/$DOMAIN/$OWNER/$PROJECT
#rvm install 2.2.1
#source .rvmrc

#bundle install
#bundle exec rspec

wrapdocker

i=0
until sudo docker info >/dev/null 2>&1; do
	echo "Waiting for internal docker.."
	sleep 5
	i=$[$i+1]
	if (( $i == 10 )); then
		echo "Timeout"
		exit 1
	fi 
done

echo "lol"
sudo docker build -t $REGISTRY/$IMAGE .

# Restart docker
sudo start-stop-daemon --stop --pidfile "/var/run/docker.pid"