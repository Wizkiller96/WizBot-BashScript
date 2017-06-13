#!/bin/sh

echo "WizBot 1.4"
echo "By Kwoth & Wizkiller96"

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi
cd WizBot
dotnet restore
dotnet build --configuration Release
cd src/WizBot
echo "Running WizBot. Please wait."
dotnet run --configuration Release
echo "Done"

exit 0
