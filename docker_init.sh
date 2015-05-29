#!/bin/bash
set -e

source /etc/profile.d/rvm.sh

rvm rvmrc trust src/
cd /src
bundle install
bundle exec rspec