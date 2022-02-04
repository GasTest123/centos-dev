docker run -d --restart always \
  --name nginx \
  -p 80:80 \
  -p 443:443 \
  -p 4000:4000 \
  -p 4000:4000/udp \
  -p 5900:5900 \
  -v /opt/docker/nginx/config/nginx.conf:/etc/nginx/nginx.conf \
  -v /opt/docker/nginx/config/conf.d:/etc/nginx/conf.d \
  -v /opt/docker/nginx/html:/usr/share/nginx/html \
  -v /opt/docker/ssl:/etc/nginx/ssl \
  nginx:stable-alpine

