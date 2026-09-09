#!/bin/sh
# Перехват CDPv2-пакетов (сегмент Cisco). Запускать на PC1 (Alt Linux).
IFACE="${1:-enp3s0f2}"
tcpdump -i "$IFACE" -v ether host 01:00:0c:cc:cc:cc
