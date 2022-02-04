docker run -d --restart always \
  --name remix \
  -p 8880:80 \
  -v /opt/docker/remix/data:/remix \
  remixproject/remix-ide:remix_live

#  remixproject/remix-ide:bump_live

