#!/bin/bash

echo "*** Pushing Image to Docker Hub ***" 

echo "*** Loggimg in ***"

IMAGE=mynewrepo1

docker login -u kom07 -p $PASS

echo "*** tagging image ***"

docker tag $IMAGE:$BUILD_TAG kom07/$IMAGE:$BUILD_TAG

docker push kom07/$IMAGE:$BUILD_TAG


