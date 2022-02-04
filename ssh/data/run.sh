#!/bin/sh
set -e

if [ ! -f /root/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519 -f /root/.ssh/id_ed25519 -N "" -q
fi

/app/serveo-linux-amd64 \
  -domain=vm.local \
  -port=2222 \
  -http_port=80 \
  -https_port=443 \
  -monitoring_addr=0.0.0.0:6060 \
  -cert_dir=/root/ssl/certs.local/ \
  -private_key_path=/root/.ssh/id_ed25519

tail -f /dev/null
#sleep infinity

