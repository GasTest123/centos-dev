#!/bin/bash
# create self-signed server certificate:

CERT="rootCA"
DAYS=825
ORG="LocalCA"
CN="LocalCA Root RSA"
OUT="./certs.rootCA"

echo "Clearing existing HTTPS SSL certs..."
rm -rf $OUT
mkdir $OUT

(
echo "Generating new HTTPS SSL certs..."
cd $OUT

openssl genrsa -out $CERT.key 2048
openssl req -new -sha256 -key $CERT.key -out $CERT.csr -subj "/C=CN/O=$ORG/CN=$CN"
openssl x509 -req -sha256 -days $DAYS -in $CERT.csr -signkey $CERT.key -out $CERT.crt

openssl x509 -in $CERT.crt -text -noout

cat $CERT.key $CERT.crt | tee $CERT.pem

chmod +rx *
)

