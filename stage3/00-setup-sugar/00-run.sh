#!/bin/bash -e

on_chroot << EOF
sudo -u root apt install lightdm xserver-xorg sucrose -y
sudo -u root dpkg-reconfigure lightdm
sudo -u root raspi-config nonint do_boot_behaviour B3
sudo -u root apt remove sugar-browse-activity -y
EOF

# Temporary fix for browse-activity: installing gir1.2-webkit2-4.1 in stage2/01-sys-tweaks/00-packages L41

# Set the default session to Sugar
CONFIG_FILE=${ROOTFS_DIR}/etc/lightdm/lightdm.conf
if grep -q "\[Seat:\*\]" "$CONFIG_FILE"; then
  sudo sed -i '/^\[Seat:\*\]/a user-session=sugar' "$CONFIG_FILE"
else
  echo -e "[Seat:*]\nuser-session=sugar" | sudo tee -a "$CONFIG_FILE"
fi
echo "Default session set to Sugar."

mkdir ${ROOTFS_DIR}/home/pi/Activities
cd ${ROOTFS_DIR}/home/pi/Activities

# Cloning the Sugar activities
git clone https://github.com/44yu5h/rpi_control_center
git clone https://github.com/44yu5h/turtleart-activity
git clone https://github.com/sugarlabs/browse-activity # removed v207 above; added latest (v208 as of now)
git clone https://github.com/sugarlabs/flappy
git clone https://github.com/sugarlabs/number-guessing
git clone https://github.com/sugarlabs/tower-of-hanoi

echo "Sugar is successfully installed."

