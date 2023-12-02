#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ ! -d /etc/thinkfan-select ]; then
    mkdir /etc/thinkfan-select
else
	echo "Configuration folder exists, skipping"
fi

if [ -f /etc/thinkfan.conf ]; then
    mv /etc/thinkfan.conf /etc/thinkfan-select/thinkfan.conf
	ln -sf /etc/thinkfan-select/thinkfan.conf /etc/thinkfan.conf
elif [ -h /etc/thinkfan.conf ]; then
    echo "Error: /etc/thinkfan.conf is already an symbolic link, skipping procees"
fi

cp thinkfan-select /usr/local/bin/.

systemctl restart thinkfan