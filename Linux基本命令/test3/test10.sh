#!/bin/bash
mkdir -p /data/backup/$(date +%Y-%m-%d-%H-%M-%S) /data/tar/gz/ /data/backup/logs
find /var/log -size +4k -exec cp {} /data/backup/$(date +%Y-%m-%d-%H-%M-%S) \;
tar -caf /data/tar/gz/$(date +%Y-%m-%d-%H-%M-%S) /data/backup/$(date +%Y-%m-%d-%H-%M-%S)_log.tar.gz
chmod a+x /root/test10.sh
