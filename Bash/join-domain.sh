#!/bin/bash
echo '$IP $AD_DOMAIN_NAME $AD_NETBIOS_NAME' >> /etc/resolv.conf
realm join --user=username1 $AD_DOMAIN_NAME
