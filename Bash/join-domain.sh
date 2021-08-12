#!/bin/bash -x
sudo echo "$AD_IP $AD_NETBIOS_NAME.$AD_DOMAIN_NAME $AD_NETBIOS_NAME" >> /etc/hosts
sudo realm join --user=Administrator $AD_NETBIOS_NAME
