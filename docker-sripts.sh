#!/bin/bash
sudo su
apt update -y
apt install docker.io -y
apt install docker-compose -y
git clone https://github.com/NMenendez24/CardMarket-Misc.git
cd CardMarket-Misc
docker-compose up --build -d