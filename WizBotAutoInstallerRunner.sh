#!/bin/sh
cd ~
echo "Please choose which version you want to install."

choice=3
    echo "1. Download Dev Build (Latest)"
    echo "2. Download Stable Build"
while [ $choice -eq 3 ]; do
read choice
if [ $choice -eq 1 ] ; then

	echo ""
	echo "Downloading WizBot, please wait."
	curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_installer_latest.sh | sh
	echo ""
	echo "WizBot Dev Build (Latest) downloaded."
    echo "Almost done! When you continue, we will pull up a text editor to edit your credentials.json. Please follow the guide on how to set this up. When you're finished, press Ctrl + X, then Y and Enter, then Enter again."
    read -n 1 -s -p "Press any key to continue"
    nano ~/WizBot/src/WizBot/credentials.json
	bash ~/WizBotRun.sh
else
	if [ $choice -eq 2 ] ; then
		echo ""
		echo "Downloading WizBot, please wait."
		curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_installer.sh | sh
		echo ""
		echo "WizBot Stable Build downloaded."
        echo "Almost done! When you continue, we will pull up a text editor to edit your credentials.json. Please follow the guide on how to set this up. When you're finished, press Ctrl + X, then Y and Enter, then Enter again."
        read -n 1 -s -p "Press any key to continue"
        nano ~/WizBot/src/WizBot/credentials.json
		bash ~/WizBotRun.sh
    fi
fi
done
exit 0