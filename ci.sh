#!/bin/bash
sudo apt-get install wget
sudo apt-get install openssl
sudo apt-get install ssl-cert
sudo apt-get install ca-certificates
sudo apt-get install git
wget https://raw.github.com/rasselin/os-ext-testing/master/puppet/install_master.sh
echo "before install_master"
echo "https://github.com/nikesh-mahalka/os-ext-testing-data" > /tmp/install_master.in
bash install_master.sh < /tmp/install_master.in
echo "after install_master"
#wget http://tarballs.openstack.org/ci/scp.jpi
sudo service jenkins restart
sudo jenkins-jobs --flush-cache update /etc/jenkins_jobs/config
sudo service zuul start
sudo service zuul-merger start
sudo service zuul restart
bash install_master.sh
sudo su - nodepool
source /etc/default/nodepool
mkdir /var/log/nodepool/image
touch /var/log/nodepool/image/image.log
nodepool image-build dpc 2>&1 | tee -a /tmp/image.log1
nodepool image-upload dpc 2>&1 | tee -a /tmp/image.log2
