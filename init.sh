#!/bin/bash

yum install -y vim lrzsz tree net-tools bash-completion-extras \
bash-completion htop rsync iproute openssl-devel zip unzip gcc man mtr \
ntpdate curl gcc-c++ make cmake wget telnet lsof httpd-tools iftop bind-utils \
nmap perl libxml2-devel zlib-devel psmisc git bzip2 perl-Digest-SHA freetype fontconfig nmap-ncat

ntpdate cn.pool.ntp.org

wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

echo 'PS1="\[\e[0m\][\[\e[32;40m\]\u\[\e[33;40m\]@\[\e[34;40m\]\h \[\e[36;40m\]\w\[\e[0m\]]\\$ "' >> /root/.bashrc

sed -i 's#^SELINUX=enforcing#SELINUX=disabled#' /etc/selinux/config

cat >> /etc/security/limits.conf << EOF
root soft nofile 65535
root hard nofile 65535
* soft nofile 65535
* hard nofile 65535
EOF

systemctl stop firewalld
systemctl disable firewalld

swapoff -a

sed -i 's!^/dev/mapper/centos-swap!#&!' /etc/fstab

shutdown -r now
