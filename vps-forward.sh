#!/bin/bash
# Author:               aigo
# Date:                 2016.10.11
# Descriptions:         this vps is regarded as a forward spot, forwarding some port stream to another vps server. ie ssh,...

RELAY_HOST=
DST_HOST=

#ssh forward
RELAY_SSH_PORT=
DST_SSH_PORT=
iptables -t nat -A PREROUTING -p tcp -d $RELAY_HOST --dport $RELAY_SSH_PORT -j DNAT --to-destination $DST_HOST:$DST_SSH_PORT
iptables -t nat -A POSTROUTING -p tcp -d $DST_HOST --dport $DST_SSH_PORT -j SNAT --to $RELAY_HOST

#ss forward
RELAY_SS_PORT=
DST_SS_PORT=
iptables -t nat -A PREROUTING -p tcp -d $RELAY_HOST --dport $RELAY_SS_PORT -j DNAT --to-destination $DST_HOST:$DST_SS_PORT
iptables -t nat -A POSTROUTING -p tcp -d $DST_HOST --dport $DST_SS_PORT -j SNAT --to $RELAY_HOST
