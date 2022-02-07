docker run -d --restart always \
  --name ssh \
  --dns 172.17.0.1 \
  --dns 10.21.100.10 \
  -p 2222:2222 \
  -p 9080:80 \
  -p 9443:443 \
  -p 6060:6060 \
  -v /opt/docker/ssh/data:/app \
  -v /opt/docker/ssh/data/ssh:/root/.ssh \
  -v /opt/docker/ssl:/root/ssl \
  --entrypoint=/app/run.sh \
  taichunmin/serveo-server

# ssh -R app:80:vm:33000 vm.local -p 2222
# kill -2 $(pidof ssh)

