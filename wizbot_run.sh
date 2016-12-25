#!/bin/sh

echo "WizBot 1.0"
echo "Mirai was here."

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

cd WizBot/src/WizBot
echo "Running WizBot. Please wait."
dotnet run --configuration Release
echo "Done"

exit 0
