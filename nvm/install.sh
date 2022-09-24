#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

if [ ! -d /data/packages/nvm ]; then
  mkdir -p /data/packages/nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | NVM_DIR=/data/packages/nvm bash
  echo "export NVM_DIR=\"/data/packages/nvm\"" >> /config/ubuntu/onstart.sh
  echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"  # This loads nvm" >> /config/ubuntu/onstart.sh
else
  bashio::log.info "NVM already installed. Nothing to do"
fi