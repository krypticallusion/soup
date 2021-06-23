#! /bin/bash

curl https://raw.githubusercontent.com/krypticallusion/soup/master/ingredients/fake-modem/fake-modem-init.sh -o fmi.sh
curl https://raw.githubusercontent.com/krypticallusion/soup/master/ingredients/fake-modem/fake-modem-sys.service -o fake-modem.service

./fmi.sh 
sudo mv ./fake-modem.service /etc/systemd/system/

sudo systemctl enable --now fake-modem

rm -rf fmi.sh
echo "Service started successfully"

