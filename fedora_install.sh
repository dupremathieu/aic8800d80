#!/usr/bin/env bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Use sudo or switch to the root user."
    exit 1
fi

echo "Starting Fedora installation script..."
echo "Install Udev rules ..."
install -m 644 aic.rules /etc/udev/rules.d/

echo "Install firmwares ..."
cp -r fw/aic8800D80/ /lib/firmware/

echo "Install packages ..."
sudo dnf install -y kmodtool akmods mokutil openssl rpm-build dkms make gcc kernel-devel

echo "Generate MOK keys ..."
sudo kmodgenca -a

echo "Enroll MOK keys ..."
mokutil --import /etc/pki/akmods/certs/public_key.der

echo "Copy sources"
mdkir -p /usr/src/
cp -r drivers/aic8800/ /usr/src/aic8800-1.0.0
cp dkms.conf /usr/src/aic8800-1.0.0/

echo "Copy cfg80211.conf"
cp cfg80211.conf /etc/modules-load.d/

echo "Add DKMS module ..."
dkms add -m aic8800 -v 1.0.0
echo "Build DKMS module ..."
dkms build -m aic8800 -v 1.0.0
echo "Install DKMS module ..."
dkms install -m aic8800 -v 1.0.0

echo "You may need to reboot your system for the changes to take effect."
echo "Installation script completed successfully."
