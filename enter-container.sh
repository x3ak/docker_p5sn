#!/usr/bin/env bash

username=${1-root}
container=${2-p5sn}

docker exec -it -u ${username} ${container} /bin/bash -c "export TERM=xterm; exec zsh"
