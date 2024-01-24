docker run -d --restart always \
  --security-opt="seccomp=unconfined" --cap-add=SYS_PTRACE \
  --name ide \
  --hostname ide \
  --add-host vm:10.21.248.107 \
  --dns 172.17.0.1 \
  --dns 10.21.100.10 \
  -p 8888:8080 \
  -p 33000:33000 \
  -v /root/.git/.ssh:/root/.ssh \
  -v /root/.git/.gitconfig:/root/.gitconfig \
  -v /opt/docker/ide/code:/opt/code \
  -v /opt/docker/ide/code/.config:/root/.config \
  -v /opt/docker/ide/code/.local:/root/.local \
  -v /opt/docker/ssl:/root/.ssl/certs \
  -v /opt/docker/_work:/root/workspace \
  -v /opt/docker:/root/docker \
  -w /root \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  --entrypoint=/opt/code/entrypoint.sh \
  node:14-buster

