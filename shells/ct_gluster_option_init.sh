#!/bin/bash
if [ ! -f "/var/lib/glusterd/groups/virt" ]; then
touch /var/lib/glusterd/groups/virt
chmod 777 /var/lib/glusterd/groups/virt
chown -R 36:36 /var/lib/glusterd/groups/virt
fi

{
echo "server.allow-insecure=on"
echo "cluster.eager-lock=on"
echo "network.frame-timeout=5"
echo "network.ping-timeout=5"
echo "nfs.disable=on"
echo "cache-size=2048MB"
echo "io-thread-count=16"
echo "md-cache-timeout=60"
echo "quick-read=on"
echo "read-ahead=on"
echo "io-cache=on"
echo "stat-prefetch=on"
} > /var/lib/glusterd/groups/virt

sed -i '$i\    option rpc-auth-allow-insecure on' /etc/glusterfs/glusterd.vol
service glusterd restart
