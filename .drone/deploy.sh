#!/bin/bash
set -e

. ./config.sh

echo "DEPLOY!!!"

#docker push --insecure-registry $REGISTRY/$IMAGE