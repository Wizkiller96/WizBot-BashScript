#!/bin/sh
echo ""
echo "Welcome to WizBot."
echo "By Kwoth & Wizkiller96"
echo ""

choice=6
	echo "1. Download Dev Build (latest)"
	echo "2. Download Stable Build"
	echo "3. Run WizBot (normally)"
	echo "4. Run WizBot with Auto Restart (check if WizBot is working properly, before using this)"
	echo "5. To exit"
	echo -n "Choose [1 or 2] to Download [3 or 4] to Run."
while [ $choice -eq 6 ]; do
read choice
if [ $choice -eq 1 ] ; then

	echo ""
	echo "Downloading WizBot, please wait."
	curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_installer_latest.sh | sh
	echo ""
	echo "WizBot Dev Build (latest) downloaded."
	bash linuxAIO.sh
else
	if [ $choice -eq 2 ] ; then
		echo ""
		echo "Downloading WizBot, please wait."
		curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_installer.sh | sh
		echo ""
		echo "WizBot Stable Build downloaded."
		bash linuxAIO.sh
	else
		if [ $choice -eq 3 ] ; then
			echo ""
			echo "Running WizBot Normally, if you are running this to check WizBot, use .die command on discord to stop WizBot."
			curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_run.sh | sh
			echo ""
			echo "Welcome back to WizBot."
			bash linuxAIO.sh
		else
			if [ $choice -eq 4 ] ; then
				echo ""
				echo "Running WizBot with Auto Restart you will have to close the session to stop the auto restart."
				sleep 5s
				wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/master/WizBotAutoRestartAndUpdate.sh && bash WizBotAutoRestartAndUpdate.sh
				echo ""
				echo "Looks like that didn't work."
			else
				if [ $choice -eq 5 ] ; then
					echo ""
					echo "Exiting..."
					exit 0
				else
					echo "1. Download Dev Build (latest)"
					echo "2. Download Stable Build"
					echo "3. Run WizBot (normally)"
					echo "4. Run WizBot with Auto Restart (check if WizBot is working properly, before using this)"
					echo "5. To exit"
					echo -n "Choose [1 or 2] to Download [3 or 4] to Run."
					choice=6
				fi
			fi
		fi
	fi
fi
done
exit 0
