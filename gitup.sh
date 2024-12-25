#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -e /etc/systemd/system/gitup.timer ]; then

ln $DIR/systemd/gitup.* /etc/systemd/system/
systemctl daemon-reload
systemctl start gitup.timer
systemctl enable gitup.timer

fi
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

systemctl stop skytekx2.service
sleep 39
cd $DIR
git add .
git commit -m "$(date) automated backup script (gitup.sh)"
git push -uf origin main;
reboot

exit 0

