#!/bin/bash
apt update -y
apt install docker.io -y
apt install docker-compose -y
docker-compose up --build -d