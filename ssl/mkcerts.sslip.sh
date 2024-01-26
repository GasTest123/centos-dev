#!/bin/bash
# create self-signed server certificate:

ROOTCA="../certs.rootCA/rootCA.crt"
ROOTCAKEY="../certs.rootCA/rootCA.key"

CERT="ca"
DAYS=825
ORG="LocalDEV"
CN="LocalDev sslip.io"
DNS1="sslip.io"
DNS2="*.sslip.io"
OUT="./certs.sslip"

echo "Clearing existing HTTPS SSL certs..."
rm -rf $OUT
mkdir $OUT

(
echo "Generating new HTTPS SSL certs..."
cd $OUT

#openssl genrsa -out $CERT.key 2048
#openssl req -new -sha256 -key $CERT.key -out $CERT.csr \
#  -subj "/C=CN/ST=Shanghai/L=Shanghai/O=$ORG/OU=$ORG/CN=$CN"

openssl req -new -sha256 -nodes -out $CERT.csr -newkey rsa:2048 -keyout $CERT.key -config <(
cat <<-EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn

[ dn ]
C=CN
ST=Shanghai
L=Shanghai
O=$ORG
OU=$ORG
CN=$CN
EOF
)

openssl x509 -req -sha256 -days $DAYS -in $CERT.csr -out $CERT.crt \
  -CA $ROOTCA -CAkey $ROOTCAKEY -CAcreateserial -extfile <(
cat <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = $DNS1
DNS.2 = $DNS2
EOF
)

openssl x509 -in $CERT.crt -text -noout

cat $CERT.key $CERT.crt | tee $CERT.pem

chmod +rx *
)

echo "=================================================="
echo "# For HaProxy:"
echo "Copy $CERT.pem to /etc/ssl/hyproxy/$CERT.pem"
echo "Add configuration in hyproxy:"
echo "frontend localhost"
echo "    mode http"
echo "    bind *:443 ssl crt /etc/ssl/hyproxy/$CERT.pem"
echo "    server web01 10.10.0.1:8080 check"
echo "    server web02 10.10.0.2:8080 check"
echo "=================================================="
echo "# For Nginx:"
echo "Copy $CERT.crt to /etc/ssl/nginx/$CERT.crt"
echo "Copy $CERT.key to /etc/ssl/nginx/$CERT.key"
echo "Add configuration in nginx:"
echo "server {"
echo "    ..."
echo "    listen 443 ssl;"
echo "    ssl_certificate     /etc/ssl/nginx/$CERT.crt;"
echo "    ssl_certificate_key /etc/ssl/nginx/$CERT.key;"
echo "}"
echo "=================================================="
echo "# For Caddy:"
echo "Copy $CERT.crt to /etc/ssl/caddy/$CERT.crt"
echo "Copy $CERT.key to /etc/ssl/caddy/$CERT.key"
echo "Add configuration in caddy:"
echo "https://:443 {"
echo "    tls /etc/ssl/caddy/$CERT.crt /etc/ssl/caddy/$CERT.key"
echo "}"
echo "=================================================="

