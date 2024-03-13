#!/bin/bash
wg show all dump > /wg_dump.txt
ifconfig enp1s0 >> /wg_dump.txt && curl -X POST -H "Content-Type: text/plain" --data-binary @/wg_dump.txt https://asia-southeast1-shortvpn.cloudfunctions.net/VPNServer_Status_Retriever
