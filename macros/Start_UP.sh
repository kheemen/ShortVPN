#!/bin/bash
sudo systemctl stop unattended-upgrades
sudo apt remove unattended-upgrades -y
apt install net-tools
curl -s https://raw.githubusercontent.com/trailofbits/algo/master/install.sh | sudo -E bash -x
cat /opt/algo/configs/*.*/wireguard/user1.conf > /alluser.txt

#!/bin/bash
for i in $(seq 1 10)
do
  if [ -s /alluser.txt ]; then
	echo "Attempt $i: alluser generated"
  else
	echo "Attempt $i: Sleep 20 wait unlock /var/lib/dpkg/lock-frontend"
	sleep 20
    curl -s https://raw.githubusercontent.com/trailofbits/algo/master/install.sh | sudo -E bash -x
	cat /opt/algo/configs/*.*/wireguard/user1.conf > /alluser.txt
  fi
done

curl -X POST --header "Content-Type: text/plain" --data-binary @/alluser.txt https://asia-southeast1-shortvpn.cloudfunctions.net/VPNServer_WG_Config_Retriever
curl "https://raw.githubusercontent.com/kheemen/ShortVPN/main/macros/scheduled.sh" -o /etc/scheduled.sh
chmod +x /etc/scheduled.sh
(crontab -l 2>/dev/null; echo "*/5 * * * * /etc/scheduled.sh") | crontab -
curl "https://raw.githubusercontent.com/kheemen/ShortVPN/main/macros/crontask.sh" -o /etc/crontask.sh
chmod +x /etc/crontask.sh
/etc/crontask.sh
(crontab -l 2>/dev/null; echo "*/1 * * * * /etc/crontask.sh") | crontab -
systemctl restart cron
