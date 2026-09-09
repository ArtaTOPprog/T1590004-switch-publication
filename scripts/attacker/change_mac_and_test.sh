#!/bin/sh
# Смена MAC-адреса для теста Port-Security (Cisco) / bridge filter (MikroTik).
# Запускать на PC1 (Alt Linux).
IFACE="${1:-enp3s0f2}"
NEWMAC="${2:-00:11:22:33:44:55}"
TARGET="${3:-10.10.10.1}"   # шлюз/адрес для проверки связности (сегмент MikroTik)

ip link set dev "$IFACE" down
ip link set dev "$IFACE" address "$NEWMAC"
ip link set dev "$IFACE" up

echo "MAC изменён на $NEWMAC, проверка связности до $TARGET:"
ping -c 4 "$TARGET"
