#!/bin/sh
echo ""
echo "Running WizBot with auto restart and updating to latest build!"
sleep 5s
while :; do cd WizBot && dotnet restore && dotnet build --configuration Release && cd - && cd WizBot/src/WizBot && dotnet run -c Release && cd - && wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.4/wizbot_installer_latest.sh && bash wizbot_installer_latest.sh; sleep 5s; done
echo ""
echo "That didn't work? Please report in Issues."
sleep 3s
bash linuxAIO.sh
echo "Done"
exit 0
