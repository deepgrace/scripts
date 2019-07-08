#!/bin/bash

systemctl stop network.service
systemctl start network.service
systemctl enable sshd.service
systemctl start sshd.service
systemctl disable cups
systemctl stop cups 
systemctl disable avahi-daemon.socket 
systemctl disable avahi-daemon.service 
systemctl stop avahi-daemon.socket 
systemctl stop avahi-daemon.service 
systemctl stop chronyd.service 
systemctl disable chronyd.service 
systemctl set-default multi-user.target 

cat << \EOF >> /etc/sysconfig/network-scripts/ifcfg-ens33
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.0.8
NETMASK=255.255.255.0
GATEWAY=192.168.0.2
EOF

cat << \EOF > /etc/resolv.conf
nameserver 8.8.4.4
nameserver 8.8.8.8
EOF

dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf -y install vim gnome-terminal fedora-workstation-repositories
dnf -y install cryptopp cryptopp-devel libzstd libzstd-devel
dnf -y config-manager --set-enabled google-chrome
dnf -y remove $(rpm -qa | grep ^boost)
dnf -y install qt5-qttools-devel qt5-qtbase-devel protobuf-devel protobuf-compiler
dnf -y install gcc gcc-c++ libtool make cmake autoconf automake openssl openssl-devel libevent-devel
dnf -y install glibc.i686 glibc-devel.i686 google-chrome-stable

dnf -y update
