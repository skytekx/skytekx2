#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -e /etc/systemd/system/mwbackup.timer ]; then

ln $DIR/systemd/mwbackup.* /etc/systemd/system/
systemctl daemon-reload
systemctl start mwbackup.timer
systemctl enable mwbackup.timer

fi

systemctl stop skytekx2.service
sleep 39
cd $DIR
tar cvzf "../../backup/skytekx2-server/world/$(date).tar.gz" world/
reboot

exit 0

