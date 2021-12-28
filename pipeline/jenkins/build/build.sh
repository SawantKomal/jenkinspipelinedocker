#!/bin/bash

# Copying new jar files to the jenkins/build dir.

cp -f java-app/target/*.jar jenkins/build 

# Build a docker image

echo "****** Building Docker Image ******"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
