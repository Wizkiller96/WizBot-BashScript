#!/bin/sh
echo ""
echo "Welcome to WizBot. Downloading the latest installer..."
root=$(pwd)
wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/wizbot_master_installer.sh

bash wizbot_master_installer.sh
cd "$root"
rm "$root/wizbot_master_installer.sh"
exit 0