#!/bin/sh
echo ""
echo "Running WizBot with auto restart and updating to latest build!"
root=$(pwd)

sleep 5s
while :; do cd "$root/WizBot" && dotnet restore && dotnet build --configuration Release && cd "$root/WizBot/src/WizBot" && dotnet run -c Release && cd "$root" && wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/1.4/wizbot_installer_latest.sh && bash "$root/wizbot_installer_latest.sh"; sleep 5s; done
echo ""
echo "That didn't work? Please report in WizNet Discord Server."
sleep 3s

cd "$root"
bash "$root/linuxAIO.sh"
echo "Done"

exit 0