#!/bin/bash -x

sleep 6m

sudo echo "$AD_IP $AD_NETBIOS_NAME.$AD_DOMAIN_NAME $AD_NETBIOS_NAME" >> /etc/hosts
sudo echo "$AD_IP $AD_DOMAIN_NAME $AD_NETBIOS_NAME" >> /etc/hosts
echo $ADMIN_PASSWORD | realm join -U Administrator $AD_NETBIOS_NAME
