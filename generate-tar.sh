#!/bin/bash

rm -rf aic8800d80-dkms aic8800d80-dkms.tar.gz
mkdir -p aic8800d80-dkms

cp -r dkms.conf fedora_install.sh fw drivers cfg80211.conf aic.rules aic8800d80-dkms/
tar -czf aic8800d80-dkms.tar.gz aic8800d80-dkms
rm -rf aic8800d80-dkms
