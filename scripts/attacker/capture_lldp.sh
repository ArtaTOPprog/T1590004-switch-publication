#!/bin/sh
# Перехват LLDP-кадров (сегменты Cisco и MikroTik). Запускать на PC1 (Alt Linux).
# Для MikroTik (ether1, 10.10.10.0/24) в статье использовано ограничение -c 3.
IFACE="${1:-enp3s0f2}"
COUNT="${2:-0}"   # 0 = без ограничения; для сценария MikroTik передайте 3

if [ "$COUNT" -gt 0 ] 2>/dev/null; then
    tcpdump -i "$IFACE" -v -c "$COUNT" ether proto 0x88cc
else
    tcpdump -i "$IFACE" -v ether proto 0x88cc
fi
