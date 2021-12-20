#!/bin/bash

init() {
  curl https://get.acme.sh | sh -s email=dequanzhang1995@hotmail.com
}

acme.sh() {
 "/root/.acme.sh/"acme.sh --home "/root/.acme.sh/" "$@"
}

cron() {
  #renew certs
  top=uxui.win
  acme.sh --issue --standalone -d $top -d www.$top -d vpn.$top
  mkdir -p $top
  acme.sh --install-cert -d $top --cert-file $top/cert.pem --key-file $top/key.pem --fullchain-file $top/fullchain.pem
  cat $top/fullchain.pem $top/key.pem > $top/$top.pem
  #restart services
  systemctl restart haproxy #load balancer
  systemctl restart ocserv  #openconnect-server
}

"$@"
