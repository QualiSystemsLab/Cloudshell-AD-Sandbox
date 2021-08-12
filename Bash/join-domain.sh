#!/bin/bash -x
sudo echo "$AD_IP $AD_DOMAIN_NAME $AD_NETBIOS_NAME" >> /etc/hosts
sudo realm join --user=username1 $AD_DOMAIN_NAME
