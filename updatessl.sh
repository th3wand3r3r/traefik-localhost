#!/usr/bin/env bash

#
# Update local SSL certificates
# See https://traefik.me for more info
# Certificates expiry every 60 days, rerun script to download latest
#

# Create SSL directory if missing
[[ ! -d traefik/ssl ]] && mkdir -p traefik/ssl

# Remove old certs if present
[[ -f traefik/ssl/cert.pem ]] && rm traefik/ssl/cert.pem
[[ -f traefik/ssl/privkey.pem ]] && rm traefik/ssl/privkey.pem
#[[ -f traefik/ssl/chain.pem ]] && rm traefik/ssl/chain.pem
#[[ -f traefik/ssl/fullchain.pem ]] && rm traefik/ssl/fullchain.pem

# Download certs from traefik.me
wget https://traefik.me/cert.pem -P traefik/ssl/
wget https://traefik.me/privkey.pem -P traefik/ssl/
#wget https://traefik.me/chain.pem -P traefik/ssl/
#wget https://traefik.me/fullchain.pem -P traefik/ssl/
