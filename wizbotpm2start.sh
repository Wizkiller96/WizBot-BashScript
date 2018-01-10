#!/bin/sh
echo ""
echo "WizBot pm2 Startup. Please ensure you have installed pm2/NodeJS/npm with the installer script first!"

echo ""
root=$(pwd)


choice=5
	echo "1. Run in pm2 with Auto Restart normally without Auto Update."
	echo "2. Run in pm2 with Auto Restart and Auto Update."
	echo "3. Run WizBot in pm2 normally without Auto Restart or Auto Update."
	echo "4. Exit"
	echo -n "Choose [1] to Run WizBot in pm2 with auto restart on "die" command without updating itself, [2] to Run in pm2 with Auto Updating on restart after using "die" command, and [3] to run without any auto-restarts or auto-updates."
while [ $choice -eq 5 ]; do
read choice
if [ $choice -eq 1 ] ; then
	echo ""
	wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/WizBotARN.sh 
	cd "$root"
	echo "Starting WizBot in pm2 with auto-restart and no auto-update..."
	sudo pm2 start "$root/WizBotARN.sh" --interpreter=bash --name=WizBot
	echo ""
	echo "If you did everything correctly, pm2 should have started up WizBot! Please use sudo pm2 info WizBot to check. You can view pm2 logs with sudo pm2 logs WizBot"
else
	if [ $choice -eq 2 ] ; then
		echo ""
		wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/WizBotARU_Latest.sh 
		cd "$root"
        echo "Starting WizBot in pm2 with auto-restart and auto-update..."
		sudo pm2 start "$root/WizBotARU_Latest.sh" --interpreter=bash --name=WizBot	
		echo ""
		echo "If you did everything correctly, pm2 should have started up WizBot! Please use sudo pm2 info WizBot to check. You can view pm2 logs with sudo pm2 logs WizBot"
	else
		if [ $choice -eq 3 ] ; then
		echo ""
		wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/wizbot_run.sh
		cd "$root"
        echo "Starting WizBot in pm2 normally without any auto update or restart.."
		sudo pm2 start "$root/wizbot_run.sh" --interpreter=bash --name=WizBot	
		echo ""
		echo "If you did everything correctly, pm2 should have started up WizBot! Please use sudo pm2 info WizBot to check. You can view pm2 logs with sudo pm2 logs WizBot"	
		else
			if [ $choice -eq 4 ] ; then
				echo ""
				echo "Exiting..."
				cd "$root"
				exit 0
			else
				clear
				echo "1. Run in pm2 with Auto Restart normally without updating WizBot."
				echo "2. Run in pm2 with Auto Restart and update WizBot."
				echo "3. Run WizBot in pm2 normally without Auto Restart."
				echo "4. Exit"
				echo -n "Choose [1] to Run WizBot in pm2 with auto restart on "die" command without updating itself, [2] to Run in pm2 with Auto Updating on restart after using "die" command, and [3] to run without any auto restarts or auto-updates."
				choice=5
			fi
		fi
	fi
fi
done

cd "$root"
rm "$root/wizbotpm2start.sh"
exit 0