#!/bin/bash

mkdir /etc/thinkfan-select

mv /etc/thinkfan.conf /etc/thinkfan-select/thinkfan.conf
ln -sf /etc/thinkfan-select/thinkfan.conf /etc/thinkfan.conf

cp thinkfan-select /usr/local/bin/.

systemctl restart thinkfan