#!/usr/bin/env bash
set -eou pipefail

brew install mkcert nss
mkcert -install
mkcert -cert-file traefik/certs/local-cert.pem -key-file traefik/certs/local-key.pem "docker.localhost" "*.docker.localhost" "montonio.dev" "*.montonio.dev" "*.montonio.com"

echo '127.0.0.1 cards.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 stargate.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 demo-blik.montonio.com' | sudo tee -a /etc/hosts
echo '127.0.0.1 pis.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 pis.montonio.com' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-pis.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-cards.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-stargate.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-mms.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-inbank.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-blik.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-shipping.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 shipping.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-nestjs-template.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 partner.montonio' | sudo tee -a /etc/hosts
echo '127.0.0.1 api.partner.montonio' | sudo tee -a /etc/hosts
echo '127.0.0.1 lamp.montonio.dev' | sudo tee -a /etc/hosts
echo '127.0.0.1 api-adyen-service.montonio.dev' | sudo tee -a /etc/hosts
