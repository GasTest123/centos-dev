docker run -d --restart always \
  --name redis \
  -p 6379:6379 \
  -v /opt/docker/redis/data:/data \
  redis:5-alpine

