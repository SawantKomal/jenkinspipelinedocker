#!/bin/bash

crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')




curl -u "jenkins:1234" -H "$crumb" -X POST http://jenkins.local:8080/job/test/build?delay=0sec

#Execute job with Parameters

curl -u "jenkins:1234" -H "$crumb" -X POST "http://jenkins.local:8080/job/ansible_test/buildWithParameters?ANSIBLE_MSG=Hello%20From%20Jenkins"
