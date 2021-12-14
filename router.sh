#!/bin/bash
# The script turn a linux box into a software baed router
# Core Services need to be installed:
#	dhcp - ics-dhcp-server
#	dns  - bind9
# Core Networking configuration
#	enable interface management
#	enable forwarding
#	enable nftable for firewall, NAT (snat), port-forwrding (dnat), etc
# General system configuration
#	ssh keys
#	ntp server addr
# Addtional system services
#       load balancer - haproxy/nginx
#       vpn - openconnect/wireguard

