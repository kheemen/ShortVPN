#!/bin/bash
curl "https://raw.githubusercontent.com/kheemen/ShortVPN/main/macros/scheduled.sh" -o /etc/scheduled.sh
chmod +x /etc/scheduled.sh
wg show all dump > /wg_dump.txt
ifconfig enp1s0 >> /wg_dump.txt && curl -X POST -H "Content-Type: text/plain" --data-binary @/wg_dump.txt https://asia-southeast1-shortvpn.cloudfunctions.net/VPNServer_Status_Retriever