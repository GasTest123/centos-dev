docker run -d --restart always \
  --name dns \
  -p 53:53 \
  -p 53:53/udp \
  -v /opt/docker/dns/data:/data \
  coredns/coredns \
  -conf /data/Corefile

