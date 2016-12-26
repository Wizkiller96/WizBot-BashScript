#!/bin/sh
echo ""
echo "Welcome to WizBot."

choice=5
	echo "1. Download Dev Build (latest)"
	echo "2. Run WizBot (normally)"
	echo "3. Run WizBot with Auto Restart (check if WizBot is working properly, before using this)"
	echo "4. To exit"
	echo -n "Choose [1] to Download [2 or 3] to Run."
while [ $choice -eq 5 ]; do
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
		echo "Running WizBot Normally, if you are running this to check WizBot, use .die command on discord to stop WizBot."
		curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_run.sh | sh
		echo ""
		echo "Welcome back to WizBot."
		bash linuxAIO.sh
	else
		if [ $choice -eq 3 ] ; then
			echo ""
			echo "Running WizBot with Auto Restart you will have to close the session to stop the auto restart."
			sleep 5s
			wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/master/WizBotAutoRestartAndUpdate.sh && bash WizBotAutoRestartAndUpdate.sh
			echo ""
			echo "Looks like that didn't work."
		else
			if [ $choice -eq 4 ] ; then
				echo ""
				echo "Exiting..."
				exit 0
			else
				echo "1. Download Dev Build (latest)"
				echo "2. Run WizBot (normally)"
				echo "3. Run WizBot with Auto Restart (check if WizBot is working properly, before using this)"
				echo "4. To exit"
				echo -n "Choose [1] to Download [2 or 3] to Run."
				choice=5
			fi
		fi
	fi
fi
done
exit 0
