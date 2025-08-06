#!/bin/bash
echo "Run: Init - OS updates and deps"
# OS
apt update -y
apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev libffi-dev liblzma-dev tk-dev \
libncurses5-dev libncursesw5-dev libgdbm-dev libc6-dev ninja-build make

echo "Run: install utils"
apt install -y plocate nano screen zip curl wget busybox git
