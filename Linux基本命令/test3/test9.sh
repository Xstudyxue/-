#!/bin/bash
mkdir -p /data/backup/$(date +%Y-%m-%d)
find /var/log -size +4k -exec cp {} /data/backup/$(date +%Y-%m-%d) \;
tar -caf /opt/$(date +%Y-%m-%d-%H-%M-%S)_log.tar.gz /data/backup/$(date +%Y-%m-%d)
echo $(date +%Y-%m-%d-%H-%M-%S) $(date +%Y-%m-%d)_log.tar.gz "status:ok" >> /data/backup/$(date +%Y-%m-%d)/backupinfo
