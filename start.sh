#!/bin/bash

mkdir -p tmp/gitlab-data

GITLAB_HOME=$(pwd)/tmp/gitlab-data

sudo docker run --rm --detach \
  --hostname gitlab.example.com \
  --publish 8444:443 --publish 8080:80 \
  --name gitlab \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ce:latest


#cat tmp/gitlab-data/config/initial_root_password
