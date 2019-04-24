#!/bin/bash

export PUBLIC_IPV4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

sudo yum update -y
sudo yum install -y freeipa-server ipa-server-dns
HOSTNAME="$PUBLIC_IPV4 ${name}.${domain} ${name}.${domain}"
sudo sed -i "1s/^/$HOSTNAME\n/" /etc/hosts
sudo ipa-server-install \
     --auto-forwarders \
     --auto-reverse \
     --hostname ${name}.${domain} \
     --setup-dns \
     -U \
     -a password -p password \
     -n ${name}.${domain} \
     -r ${upper(name)}.${upper(domain)}
