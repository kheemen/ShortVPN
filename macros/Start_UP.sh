#!/bin/bash
curl -s https://raw.githubusercontent.com/trailofbits/algo/master/install.sh | sudo -E bash -x
wg showconf wg0 > /alluser.txt
curl -X POST --header "Content-Type:application/xml" -d @/alluser.txt https://asia-southeast1-shortvpn.cloudfunctions.net/VPNServer_Status_Retriever
apt install net-tools
curl "https://raw.githubusercontent.com/kheemen/ShortVPN/main/macros/scheduled.sh" -o /etc/scheduled.sh
chmod +x /etc/scheduled.sh
(crontab -l 2>/dev/null; echo "*/5 * * * * /etc/scheduled.sh") | crontab -
curl "https://raw.githubusercontent.com/kheemen/ShortVPN/main/macros/crontask.sh" -o /etc/crontask.sh
chmod +x /etc/crontask.sh
(crontab -l 2>/dev/null; echo "*/2 * * * * /etc/crontask.sh") | crontab -
systemctl restart cron
