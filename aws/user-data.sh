#!/bin/bash

sudo su

export EMAIL="${email}"
export PUBLIC_IPV4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
export WORKDIR="/opt/freeipa-letsencrypt"

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum update -y
yum install -y freeipa-server ipa-server-dns certbot git
_HOSTNAME="$PUBLIC_IPV4 ${name}.${domain} ${name}.${domain}"
sed -i "1s/^/$_HOSTNAME\n/" /etc/hosts
ipa-server-install \
     --auto-forwarders \
     --hostname ${name}.${domain} \
     --setup-dns \
     -U \
     -a password -p password \
     -n ${name}.${domain} \
     -r ${upper(name)}.${upper(domain)}
mkdir -p /opt
git clone https://github.com/codejamninja/freeipa-letsencrypt.git /opt/freeipa-letsencrypt
cd $WORKDIR
(echo Y) | $WORKDIR/setup-le.sh
(crontab -l 2>/dev/null; echo "00 00 * * * $WORKDIR/renew-le.sh") | crontab -
