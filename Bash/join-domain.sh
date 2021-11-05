#!/bin/bash -x

sleep 7m

sudo echo "$AD_IP $AD_NETBIOS_NAME.$AD_DOMAIN_NAME $AD_NETBIOS_NAME" >> /etc/hosts
sudo echo "$AD_IP $AD_DOMAIN_NAME $AD_NETBIOS_NAME" >> /etc/hosts
sudo echo $ADMIN_PASSWORD > admin_pass.pwd
echo $ADMIN_PASSWORD | realm join -U Administrator $AD_NETBIOS_NAME
