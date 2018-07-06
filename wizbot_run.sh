#!/bin/sh
echo ""
echo "WizBot 1.9+"
echo "By Kwoth & Wizkiller96"
root=$(pwd)
youtube-dl -U

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi
cd "$root/WizBot"
dotnet restore
dotnet build -c Release
cd "$root/WizBot/src/WizBot"
echo "Running WizBot. Please wait."
dotnet run -c Release
echo "Done"

cd "$root"
rm "$root/wizbot_run.sh"
exit 0