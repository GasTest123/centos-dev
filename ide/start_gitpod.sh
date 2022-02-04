docker run -d --restart always \
  --name ide \
  --hostname ide \
  --add-host vm:10.21.248.107 \
  --dns 172.17.0.1 \
  --dns 10.21.100.10 \
  -p 8888:3000 \
  -p 33000:33000 \
  -v /root/.ssh.git:/root/.ssh \
  -v /opt/docker/ide/code:/opt/code \
  -v /opt/docker/ide/code/.config_gitpod:/root/.config \
  -v /opt/docker/ide/code/.local_gitpod:/root/.local \
  -v /opt/docker/ssl:/root/.ssl/certs \
  -v /opt/docker/_work:/root/workspace \
  -v /opt/docker:/root/docker \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  --entrypoint=/opt/code/entrypoint_gitpod.sh \
  node:14-buster

