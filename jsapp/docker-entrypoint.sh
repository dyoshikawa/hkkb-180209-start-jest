#!/usr/bin/env bash
if [ -f index.html ]; then
    sudo rm -rf /var/www/jsapp-pre
    sudo npm install
    sudo npm run build
else
    sudo mv /var/www/jsapp-pre/* /var/www/jsapp/
    sudo mv /var/www/jsapp-pre/.??* /var/www/jsapp/
    sudo rmdir /var/www/jsapp-pre
fi
sudo chown -R 1000:1000 /var/www/jsapp
sudo nginx -g 'daemon off;'