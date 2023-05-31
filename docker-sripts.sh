#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo apt install docker-compose -y
git clone https://github.com/NMenendez24/CardMarket-Misc.git
cd CardMarket-Misc
sudo docker-compose up --build -d