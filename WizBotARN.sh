#!/bin/sh
echo ""
echo "Running WizBot with auto restart normally! (without updating)"
sleep 5s
cd WizBot/src/WizBot
while :; do dotnet run -c Release; sleep 5s; done
echo ""
echo "That didn't work? Please report in WizNet Discord Server."
sleep 3s
bash linuxAIO.sh
echo "Done"
exit 0
