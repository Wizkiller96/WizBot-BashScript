#!/bin/sh
cd ~
echo "Please choose the way you want to run WizBot."

choice=3
    echo "1. Run WizBot (Normally)"
    echo "2. Run WizBot with Auto Restart (Use normal start first before using this.)"

while [ $choice -eq 3 ]; do
read choice
if [ $choice -eq 1 ] ; then
			echo ""
			echo "Running WizBot Normally, if you are running this to check WizBot, use .die command on discord to stop WizBot."
			curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_run.sh | sh
			echo ""
			echo "Welcome back to WizBot."
			bash linuxAIO.sh
		else
			if [ $choice -eq 2 ] ; then
				echo ""
				echo "Running WizBot with Auto Restart you will have to close the session to stop the auto restart."
				sleep 5s
				wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/master/WizBotAutoRestartAndUpdate.sh && bash WizBotAutoRestartAndUpdate.sh
				echo ""
				echo "Looks like that didn't work."
        fi
fi
done
exit 0