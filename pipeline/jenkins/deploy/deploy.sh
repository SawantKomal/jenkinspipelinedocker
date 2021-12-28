#!/bin/bash

echo "mynewrepo1" > /tmp/.auth
echo "$BUILD_TAG" >> /tmp/.auth
echo "$PASS" >> /tmp/.auth

scp -i /opt/prod /tmp/.auth jenkins@192.168.231.140:/tmp/.auth

scp -i /opt/prod  jenkins/deploy/publish jenkins@192.168.231.140:/tmp/publish

ssh -i /opt/prod  jenkins@192.168.231.140 "/tmp/publish"

