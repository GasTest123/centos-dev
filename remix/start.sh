docker run -d --restart always \
  --name remix \
  --hostname remix \
  --add-host vm:10.21.248.107 \
  --dns 172.17.0.1 \
  --dns 10.21.100.10 \
  -p 8880:80 \
  -p 8881:8080 \
  -p 2015:2015 \
  -p 2019:2019 \
  -p 8545:8535 \
  -p 65520:65510 \
  -p 65522:65512 \
  -p 65523:65513 \
  -v /opt/docker/remix/data:/app \
  -v /opt/docker/remix/data/.config:/root/.config \
  -v /opt/docker/remix/data/.local:/root/.local \
  -v /opt/docker/_work:/root/workspace \
  -v /opt/docker/ssl:/root/.ssl/certs \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  --entrypoint=/app/entrypoint.sh \
  node:14-buster

