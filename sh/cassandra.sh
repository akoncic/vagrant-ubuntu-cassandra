#!/bin/bash

HO='\033[7m'
HC='\033[0m'

echo -e ${HO}Running apt-get update/upgrade...${HC}
sudo apt-get update -y
sudo apt-get upgrade -y

echo -e ${HO}Adding Apache Cassandra repository to package sources...${HC}
echo "deb http://www.apache.org/dist/cassandra/debian 310x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list

echo -e ${HO}Adding Apache Cassandra repository keys...${HC}
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -

echo -e ${HO}Running apt-get update again...${HC}
sudo apt-get update -y

echo -e ${HO}Installing Cassandra...${HC}
sudo apt-get install cassandra -y

echo -e ${HO}Clustering Cassandra...${HC}
sudo service cassandra stop

sudo rm -rf /var/lib/cassandra/data/system/*
sudo mv -f /etc/cassandra/cassandra.yaml /etc/cassandra/cassandra.yaml.backup
sudo cp -f /vagrant/config/cassandra$1.yaml /etc/cassandra/cassandra.yaml

echo -e ${HO}Starting Cassandra cluster...${HC}
sudo service cassandra start

sudo chmod u+x /vagrant/sh/*.sh

echo -e ${HO}Done!${HC}
