NODE1=$(hostname -I | awk '{print $1}')

docker run -d --restart always \
  --name consul \
  -p 8500:8500 \
  -p 8600:8600/udp \
  -v /opt/docker/consul/data:/consul/data \
  -v /opt/docker/consul/config:/consul/config \
  consul:1.10 \
  agent -server -bootstrap -ui \
  --datacenter=dc1 \
  -node=node1 \
  -client='0.0.0.0' \
  -advertise ${NODE1}

