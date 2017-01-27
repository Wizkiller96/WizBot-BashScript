#!/bin/sh
echo "Welcome to WizBot AutoInstaller!"
echo ""
echo "Please note: This installer only works on Ubuntu 16.04LTS. If you aren't running that version, please download the correct version for your OS."
echo ""
echo "If you dont know what version you're running, do 'lsb_release -a' in your terminal (witout the 's)."
echo ""
echo "This installer will download all of the required packages for WizBot. It will use about 350MB of space. This might take awhile to download if you dont have a good internet connection."
echo ""
read -n 1 -s -p "Press any key to continue"

sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
sudo apt install git -y
sudo apt install dotnet-dev-1.0.0-preview2.1-00317 -y
sudo apt-get install libopus0 opus-tools libopus-dev libsodium-dev ffmpeg tmux -y
cd ~
wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/master/linuxAIO.sh
wget -N https://github.com/Wizkiller96/WizBot-BashScript/raw/master/WizBotAutoInstallerRunner.sh
tmux new -s WizBot 'bash ./WizBotAutoInstallerRunner.sh'
