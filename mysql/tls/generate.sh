#!/bin/bash

# Used to regenerate our development certificates.
# NEVER TO BE USED IN PRODUCTION.
# LOCAL DEVELOPMENT ONLY.

# Create a private CA
openssl genrsa -out ca.key 4096
openssl req -new -x509 -days 3650 -key ca.key -out ca.pem -subj "/CN=MySQL Test CA"

# Create a server key/csr
openssl genrsa -out server-key.pem 2048
openssl req -new -key server-key.pem -out server.csr -subj "/CN=localhost"

# Self sign certificates
cat > server-ext.cnf <<'EOF'
subjectAltName=DNS:localhost
keyUsage = digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
EOF
openssl x509 -req -in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial \
  -out server-cert.pem -days 825 -extfile server-ext.cnf
chmod 600 server-key.pem

