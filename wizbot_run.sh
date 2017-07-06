#!/bin/sh
echo ""
echo "WizBot 1.5+"
echo "By Kwoth & Wizkiller96"
root=$(pwd)

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi
cd "$root/WizBot"
dotnet restore
dotnet build --configuration Release
cd "$root/WizBot/src/WizBot"
echo "Running WizBot. Please wait."
dotnet run --configuration Release
echo "Done"

cd "$root"
exit 0