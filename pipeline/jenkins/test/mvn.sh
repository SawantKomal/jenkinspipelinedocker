#!/bin/bash

WORKSPACE="/home/ubuntu/jenkins/jenkins_home/workspace/TestPipeline"

echo "##########################"
echo "**** Testing the code ****"
echo "##########################"

docker container run -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven "$@"

