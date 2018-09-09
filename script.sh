#!/bin/bash

tcpdump -ne -c 100 > packets

#Filter packets

grep "ARP" packets > ARP
grep "UDP" packets > UDP
grep "IPv4" packets > IPv4

# ARP packet cuts:

cut -d " " -f 1 ARP > ARP_timestamp
cut -d " " -f 2 ARP > ARP_mac
cut -d " " -f 4 ARP > ARP_dmac
cut -d " " -f 9 ARP > ARP_length
cut -d " " -f 12 ARP > ARP_sIP
cut -d " " -f 14 ARP > ARP_dIP

# UDP packet cuts:

cut -d " " -f 1 UDP > UDP_timestamp
cut -d " " -f 2 UDP > UDP_smac
cut -d " " -f 4 UDP > UDP_dmac
cut -d " " -f 9 UDP > UDP_length
cut -d " " -f 10 UDP> UDP_sIP
cut -d "." -f 1,2,3,4 UDP_sIP > UDP_sip
cut -d "." -f 5 UDP_sIP > UDP_sport
cut -d " " -f 12 UDP > UDP_dIP
cut -d "." -f 1,2,3,4 UDP_dIP > UDP_dip
cut -d "." -f 5 UDP_dIP > UDP_dport

# IPv4 Packet cuts:

cut -d " " -f 1 IPv4 > IPv4_timestamp
cut -d " " -f 2 IPv4 > IPv4_smac
cut -d " " -f 4 IPv4 > IPv4_dmac
cut -d " " -f 9 IPv4 > IPv4_length
cut -d " " -f 10 IPv4 > IPv4_sIP
cut -d "." -f 1,2,3,4 IPv4_sIP > IPv4_sip
cut -d "." -f 5 IPv4_sIP > IPv4_sport
cut -d " " -f 12 IPv4 > IPv4_dIP
cut -d "." -f 1,2,3,4 IPv4_dIP > IPv4_dip
cut -d "." -f 5 IPv4_dIP > IPv4_dport

paste ARP_timestamp ARP_mac ARP_dmac ARP_length ARP_sIP ARP_dIP > ARP

paste UDP_timestamp UDP_smac UDP_dmac UDP_length UDP_sip UDP_sport UDP_dip UDP_dport > UDP 

paste IPv4_timestamp IPv4_smac IPv4_dmac IPv4_length IPv4_sip IPv4_sport IPv4_dip IPv4_dport > IPv4


