#!/usr/bin/env bash

NODE_VER=$(echo ${NODE_VERSION} | awk -F. '{print $1}')
cp /app/node_env.${NODE_VER} /root/.bashrc.node
echo 'source /root/.bashrc.node' >> /root/.bashrc

# npm install -g @remix-project/remixd

cp -rf /app/tools/nc /usr/local/bin/
cp -rf /app/tools/socat/socat /usr/local/bin/
cp -rf /app/tools/socat/*.so.0 /usr/lib/x86_64-linux-gnu/

. /root/.bashrc

nohup \
  remixd -s /root/workspace --remix-ide https://remix.vm.x \
  > /dev/null 2>&1 &

nohup \
  node /app/ganache/ganache-core.docker.cli.js \
  > /dev/null 2>&1 &

nohup \
  /app/caddy/caddy run --config=/app/caddy/Caddyfile \
  > /dev/null 2>&1 &

nohup \
  /app/traefik/traefik --configFile=/app/traefik/traefik.toml \
  > /dev/null 2>&1 &

#nohup socat TCP4-LISTEN:65510,reuseaddr,fork TCP4:127.0.0.1:65520 > /dev/null 2>&1 &
#nohup socat TCP4-LISTEN:65512,reuseaddr,fork TCP4:127.0.0.1:65522 > /dev/null 2>&1 &
#nohup socat TCP4-LISTEN:65513,reuseaddr,fork TCP4:127.0.0.1:65523 > /dev/null 2>&1 &

tail -f /dev/null
#sleep infinity

