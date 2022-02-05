docker run -d --restart always \
  --name ipfs \
  -p 8800:8080 \
  -p 4001:4001 \
  -p 5001:5001 \
  -v /opt/docker/ipfs/data:/data/ipfs \
  -v /opt/docker/ipfs/staging:/export \
  -v /opt/docker/ipfs/bin/start_ipfs:/usr/local/bin/start_ipfs \
  -e IPFS_PROFILE=server \
  -e IPFS_SWARM_KEY_=0000100002000030000400005 \
  ipfs/go-ipfs

docker run -d --restart always \
  --name ipfs-webui \
  -p 3000:80 \
  ipfs/ipfs-webui

#docker exec -it ipfs sh -c 'ipfs bootstrap rm --all'

