#!/bin/sh

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

cd WizBot/src/WizBot
echo "Running WizBot with auto restart Please wait."
while :; do dotnet run -c Release; sleep 5s; done
echo "Done"

exit 0
