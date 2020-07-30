#!/bin/sh
echo ""
echo "Running WizBot with auto restart normally! (without updating)"
root=$(pwd)
youtube-dl -U

sleep 5s
cd "$root/WizBot"
dotnet restore && dotnet build -c Release

while :; do cd "$root/WizBot/src/WizBot" && dotnet run -c Release && youtube-dl -U; sleep 5s; done
echo ""
echo "That didn't work? Please report in WizNet Discord Server."
sleep 3s

cd "$root"
bash "$root/linuxAIO.sh"
echo "Done"

exit 0