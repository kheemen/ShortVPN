#!/bin/bash
wg show all dump > /wg_dump.txt && curl -X POST -d @/wg_dump.txt https://asia-southeast1-shortvpn.cloudfunctions.net/VPNServer_Status_Retriever
ifconfig enp1s0 > /ifconfig_dump.txt && curl -X POST -d @/ifconfig_dump.txt https://asia-southeast1-shortvpn.cloudfunctions.net/VPNServer_Status_Retriever