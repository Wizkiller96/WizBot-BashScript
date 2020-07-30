#!/bin/sh
echo ""
echo "WizBot Installer started."

if hash git 1>/dev/null 2>&1
then
    echo ""
    echo "Git Installed."
else
    echo ""    
    echo "Git is not installed. Please install Git."
    exit 1
fi


if hash dotnet 1>/dev/null 2>&1
then
    echo ""
    echo "Dotnet installed."
else
    echo ""
    echo "Dotnet is not installed. Please install dotnet."
    exit 1
fi

root=$(pwd)
tempdir=WizBotInstall_Temp

rm -r "$tempdir" 1>/dev/null 2>&1
mkdir "$tempdir"
cd "$tempdir"

echo ""
echo "Downloading WizBot, please wait."
git clone -b 1.9 --recursive --depth 1 https://github.com/Wizkiller96/WizBot.git
echo ""
echo "WizBot downloaded."

echo ""
echo "Downloading WizBot dependencies"
cd "$root/$tempdir/WizBot"
dotnet restore
echo ""
echo "Download done"

echo ""
echo "Building WizBot"
dotnet build --configuration Release
echo ""
echo "Building done. Moving WizBot"

cd "$root"

if [ ! -d WizBot ]
then
    mv "$tempdir"/WizBot WizBot
else
    rm -rf WizBot_old 1>/dev/null 2>&1
    mv -fT WizBot WizBot_old 1>/dev/null 2>&1
    mv "$tempdir"/WizBot WizBot
    cp -f "$root/WizBot_old/src/WizBot/credentials.json" "$root/WizBot/src/WizBot/credentials.json" 1>/dev/null 2>&1
    echo ""
    echo "credentials.json copied to the new version"
    cp -RT "$root/WizBot_old/src/WizBot/bin/" "$root/WizBot/src/WizBot/bin/" 1>/dev/null 2>&1
    cp -RT "$root/WizBot/src/WizBot/bin/Release/netcoreapp1.0/data/WizBot.db" "$root/WizBot/src/WizBot/bin/Release/netcoreapp2.1/data/WizBot.db" 1>/dev/null 2>&1
	cp -RT "$root/WizBot/src/WizBot/bin/Release/netcoreapp1.1/data/WizBot.db" "$root/WizBot/src/WizBot/bin/Release/netcoreapp2.1/data/WizBot.db" 1>/dev/null 2>&1
    cp -RT "$root/WizBot/src/WizBot/bin/Release/netcoreapp2.0/data/WizBot.db" "$root/WizBot/src/WizBot/bin/Release/netcoreapp2.1/data/WizBot.db" 1>/dev/null 2>&1
    mv -f "$root/WizBot/src/WizBot/bin/Release/netcoreapp1.0/data/WizBot.db" "$root/WizBot/src/WizBot/bin/Release/netcoreapp1.0/data/WizBot_old.db" 1>/dev/null 2>&1
	mv -f "$root/WizBot/src/WizBot/bin/Release/netcoreapp1.1/data/WizBot.db" "$root/WizBot/src/WizBot/bin/Release/netcoreapp1.1/data/WizBot_old.db" 1>/dev/null 2>&1
    mv -f "$root/WizBot/src/WizBot/bin/Release/netcoreapp2.0/data/WizBot.db" "$root/WizBot/src/WizBot/bin/Release/netcoreapp2.0/data/WizBot_old.db" 1>/dev/null 2>&1
    echo ""
    echo "Database copied to the new version"
    cp -RT "$root/WizBot_old/src/WizBot/data/" "$root/WizBot/src/WizBot/data/" 1>/dev/null 2>&1
    echo ""
    echo "Other data copied to the new version"
fi

rm -r "$tempdir"
echo ""
echo "Installation Complete."

cd "$root"
rm "$root/wizbot_installer_latest.sh"
exit 0