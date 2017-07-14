#!/bin/sh
echo ""
echo "Welcome to WizBot Auto Restart and Update!"
echo ""
root=$(pwd)


choice=4
	echo "1. Run Auto Restart normally without updating WizBot."
	echo "2. Run Auto Restart and update WizBot."
	echo "3. Exit"
	echo -n "Choose [1] to Run WizBot with auto restart on "die" command without updating itself, [2] to Run with Auto Updating on restart after using "die" command."
while [ $choice -eq 4 ]; do
read choice
if [ $choice -eq 1 ] ; then
	echo ""
	wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.4/WizBotARN.sh && bash "$root/WizBotARN.sh"
else
	if [ $choice -eq 2 ] ; then
		echo ""
		wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.4/WizBotARU_Latest.sh && bash "$root/WizBotARU_Latest.sh"
	else
			if [ $choice -eq 3 ] ; then
				echo ""
				echo "Exiting..."
				cd "$root"
				exit 0
			else
				clear
				echo "1. Auto Restart normally without updating WizBot."
				echo "2. Auto Restart and update WizBot."
				echo "3. Exit"
				echo -n "Choose [1] to Run WizBot with auto restart on "die" command without updating itself, [2] to Run with Auto Updating on restart after using "die" command."
				choice=4
			fi
		
	fi
fi
done

cd "$root"
rm "$root/WizBotAutoRestartAndUpdate.sh"
exit 0