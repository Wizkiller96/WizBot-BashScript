#!/bin/sh

echo "WizBot 1.0"
echo "By Kwoth & Wizkiller96"

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

cd NadekoBot/src/WizBot
echo "Running WizBot. Please wait."
dotnet run --configuration Release
echo "Done"

exit 0
