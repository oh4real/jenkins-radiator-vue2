#!/bin/sh

grep -rl "JENKINS_HOST" /etc/nginx/conf.d/* | xargs -r sed -i "s|\\\$JENKINS_HOST|${JENKINS_HOST}|g"

nginx -g 'daemon off;'