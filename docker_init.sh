#!/bin/bash
set -e

source /etc/profile.d/rvm.sh
cd /src

bundle install
bundle exec rspec