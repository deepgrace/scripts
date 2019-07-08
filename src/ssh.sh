#!/bin/bash
# ssh.sh
#
# /etc/hosts  192.168.0.{1..n} node{1..n}
# /usr/local/sbin ln -s ssh.sh node{1..n}
# node1 "echo '${local_variable}'"
# node1 "cat local_big_archive.tar.bz2" | tar -jxpvf -
# tar -jcpvf - /path/to/data | node1 "cat > /dev/tape"
# node1 "cd /path/to/dir; tar -jxpvf -" < local_big_archive.tar.bz2
# node1 "dd if=/dev/sda bs=512 count=1" | node2 "cd /usr; dd of=mbr.bin"
# node1 "dd <  /dev/sda bs=512 count=1" | node2 "cd /usr; dd >  mbr.bin"
# node1 "mysqldump" | mysql
# node1 "mysqldump" > backup.sql
# node1 
# node1 "uptime"
# node1 "uptime" > local_file  
# node1 "uptime  > remote_file"
# node1 "bash -s" < script_to_run
# node1 "bash -s" < script_to_run > local_file
# node1 "bash -s  > remote_file" < script_to_run
# tar -jcpvf - /path/to/data | node1 "cd /target/dir; tar -jxpvf -"
# cd /target/dir; node1 "tar -jcpvf - /path/to/data" |  tar -jxpvf -
# rsync -Pvzrtopg /path/to/data/ node1:/root/
# rsync -Pvzrtopg node1:/path/to/data /root/

ssh ${0##*/} "${@}"
