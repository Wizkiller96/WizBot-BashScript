#!/bin/sh
echo ""
echo "Running WizBot with auto restart and updating to latest build!"
sleep 5s
while :; do cd WizBot/src/WizBot && dotnet run -c Release && cd - && curl -L https://github.com/Wizkiller96/WizBot-BashScript/raw/master/wizbot_installer_latest.sh | sh; sleep 5s; done
echo ""
echo "That didn't work? Please report in WizNet Discord Server."
sleep 3s
bash linuxAIO.sh
echo "Done"
exit 0
