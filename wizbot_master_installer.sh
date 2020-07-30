#!/bin/sh

echo "Welcome to WizBot."
root=$(pwd)
echo ""
choice=9
	echo "1. Download WizBot"
	echo "2. Run WizBot (Normally)"
	echo "3. Run WizBot with Auto Restart in this session"
	echo "4. Auto-Install Prerequisites (For Ubuntu, Debian and CentOS)"
	echo "5. Set up credentials.json (If you have downloaded WizBot already)"
	echo "6. Auto-Install pm2 (For pm2 information, see README!)"
	echo "7. Start WizBot in pm2 (Complete option 6 first!)"
	echo "8. Exit"
	echo -n "Choose [1] to Download, [2 or 3] to Run, [6 and 7] for pm2 setup/startup (see README) or [8] to Exit."
while [ $choice -eq 9 ]; do
read choice
if [ $choice -eq 1 ] ; then

	echo ""
	echo "Downloading WizBot, please wait."
	wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/wizbot_installer_latest.sh && bash "$root/wizbot_installer_latest.sh"
	echo ""
	bash "$root/linuxAIO.sh"
else
		if [ $choice -eq 2 ] ; then
			echo ""
			echo "Running WizBot Normally, if you are running this to check WizBot, use .die command on discord to stop WizBot."
			wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/wizbot_run.sh && bash "$root/wizbot_run.sh"
			echo ""
			echo "Welcome back to WizBot."
			sleep 2s
			bash "$root/linuxAIO.sh"
		else
			if [ $choice -eq 3 ] ; then
				echo ""
				echo "Running WizBot with Auto Restart you will have to close the session to stop the auto restart."
				sleep 5s
				wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/WizBotAutoRestartAndUpdate.sh && bash "$root/WizBotAutoRestartAndUpdate.sh"
				echo ""
				echo "That did not work?"
				sleep 2s
				bash "$root/linuxAIO.sh"
			else
				if [ $choice -eq 4 ] ; then
					echo ""
					echo "Getting the Auto-Installer for Debian/Ubuntu"
					wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/wizbotautoinstaller.sh && bash "$root/wizbotautoinstaller.sh"
					echo ""
					echo "Welcome back..."
					sleep 2s
					bash "$root/linuxAIO.sh"
				else
					if [ $choice -eq 5 ] ; then
						echo ""
						echo
echo -e "Let's begin creating a new credentials.json file if you are about to run the WizBot for the first time. \n \nPlease read JSON Explanations in the guide... \n \nPress [Y] when you are ready to continue or [N] to exit."
while true; do
    read -p "[y/n]: " yn
    case $yn in
        [Yy]* ) clear; break;;
        [Nn]* ) echo Exiting...; exit;;
        * ) echo "Couldn't get that please type [y] for Yes or [n] for No.";;
    esac
done
clear
cd "$root/WizBot/src/WizBot"
mv credentials.json credentials.json.old

echo Please enter your bot token \(It is not bot secret, it should be ~59 characters long.\):
echo ""
read token
echo ""
echo Alright saved \'$token\' as your bot\'s token.
echo ""
echo "----------"
echo ""

echo Please enter your own ID \(Refer to the guide, it will be bot\'s owner ID.\):
echo ""
read ownerid
echo ""
echo Alright saved \'$ownerid\' as owner\'s ID.
echo ""
echo "----------"
echo ""

echo Please enter your admins ID \(Refer to the guide, it will be bot\'s admin ID.\):
echo ""
read adminid
echo ""
echo Alright saved \'$adminid\' as admin\'s ID.
echo ""
echo "----------"
echo ""

echo Please enter Patreon Access Token or Just Press [Enter Key] to skip. \(optional\) \(Refer to the JSON Explanations guide.\):
echo ""
read patreon
echo ""
echo Alright saved \'$patreon\'
echo ""
echo "----------"
echo ""

echo Please enter Patreon Campaign Id or Just Press [Enter Key] to skip. \(optional\) \(Refer to the JSON Explanations guide.\):
echo ""
read patreonid
echo ""
echo Alright saved \'$patreonid\'
echo ""
echo "----------"
echo ""

echo Please enter Google API key \(Refer to the guide.\):
echo ""
read googleapi
echo ""
echo Alright saved \'$googleapi\' as your bot\'s Google API Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter Mashape Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read mashapekey
echo ""
echo Alright saved \'$mashapekey\' as your bot\'s Mashape Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter OSU API Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read osu
echo ""
echo Alright saved \'$osu\' as your bot\'s OSU API Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter Cleverbot API Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read cleverbot
echo ""
echo Alright saved \'$cleverbot\' as your bot\'s Cleverbot API Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter Twitch Client ID or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read twitchcid
echo ""
echo Alright saved \'$twitchcid\' as your bot\'s Twitch Client ID.
echo ""
echo "----------"
echo ""

echo -e "Please enter Location IQ Api Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read locationiqapi
echo ""
echo Alright saved \'$locationiqapi\' as your bot\'s Location IQ API Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter Timezone DB Api Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read timedbapi
echo ""
echo Alright saved \'$timedbapi\' as your bot\'s Timezone DB API Key.
echo ""
echo "----------"
echo ""

echo "{
  \"Token\": \"$token\",
  \"OwnerIds\": [
    $ownerid
  ],
  \"AdminIds\": [
    $adminid
  ],
  \"PatreonAccessToken\": \"$patreon\",
  \"PatreonCampaignId\": \"$patreonid\",
  \"GoogleApiKey\": \"$googleapi\",
  \"MashapeKey\": \"$mashapekey\",
  \"OsuApiKey\": \"$osu\",
  \"CleverbotApiKey\": \"$cleverbot\",
  \"TwitchClientId\": \"$twitchcid\",
  \"LocationIqApiKey\": \"$locationiqapi\",
  \"TimezoneDbApiKey\": \"$timedbapi\",
  \"Db\": null,
  \"TotalShards\": 1
}" | cat - >> credentials.json
echo Credentials setup completed.
sleep 5
clear
cd "$root"
bash "$root/linuxAIO.sh"
					else
						if [ $choice -eq 6 ] ; then
						echo ""
						echo "Starting the setup for pm2 with WizBot. This only has to be done once."
						wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/wizbotpm2setup.sh && bash "$root/wizbotpm2setup.sh"
						echo ""
						echo "Welcome back..."
						sleep 2s
						bash "$root/linuxAIO.sh"	
						else
							if [ $choice -eq 7 ] ; then
							echo ""
							echo "Getting the pm2 startup options for WizBot.."
							wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.9/wizbotpm2start.sh && bash "$root/wizbotpm2start.sh"
							echo ""
							sleep 2s
							bash "$root/linuxAIO.sh"
							else
								if [ $choice -eq 8 ] ; then
									echo ""
									echo "Exiting..."
									cd "$root"
									exit 0
								else
									clear
									echo "1. Download WizBot"
									echo "2. Run WizBot (Normally)"
									echo "3. Run WizBot with Auto Restart in this session"
									echo "4. Auto-Install Prerequisites (For Ubuntu, Debian and CentOS)"
									echo "5. Set up credentials.json (If you have downloaded WizBot already)"
									echo "6. Auto-Install pm2 (For pm2 information, see README!)"
									echo "7. Start WizBot in pm2 (Complete option 6 first!)"
									echo "8. Exit"
									echo -n "Choose [1] to Download, [2 or 3] to Run, [6 and 7] for pm2 setup/startup (see README) or [8] to Exit."
									choice=9
								fi
							fi	
						fi 
					fi
				fi
			fi
		fi
	fi
done

cd "$root"
exit 0