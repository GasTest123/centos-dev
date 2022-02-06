docker run -d --restart always \
  --name samba \
  -p 139:139 \
  -p 445:445 \
  -v /opt/docker/samba/config/smb.conf:/etc/samba/smb.conf \
  -v /opt/docker/samba/data:/root/data \
  -e USERID=$(id -u) \
  -e GROUPID=$(id -g) \
  dperson/samba -p \
  -u "vm;123123"

