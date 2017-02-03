#!/bin/bash -e

function detect_OS_ARCH_VER_BITS {
	ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
	if [ -f /etc/lsb-release ]; then
	    . /etc/lsb-release
	    OS=$DISTRIB_ID
	    VER=$DISTRIB_RELEASE
	elif [ -f /etc/debian_version ]; then
	    OS=Debian  # XXX or Ubuntu??
	    VER=$(cat /etc/debian_version)
	#elif [ -f /etc/redhat-release ]; then
	else
	    OS=$(uname -s)
	    VER=$(uname -r)
	fi
	case $(uname -m) in
	x86_64)
	    BITS=64
	    ;;
	i*86)
	    BITS=32
	    ;;
	armv*)
	    BITS=32
	    ;;
	*)
	    BITS=?
	    ;;
	esac
	case $(uname -m) in
	x86_64)
	    ARCH=x64  # or AMD64 or Intel64 or whatever
	    ;;
	i*86)
	    ARCH=x86  # or IA32 or Intel32 or whatever
	    ;;
	*)
	    # leave ARCH as-is
	    ;;
	esac
}

declare OS ARCH VER BITS

detect_OS_ARCH_VER_BITS

export OS ARCH VER BITS

if [ "$BITS" = 32 ]; then
	echo -e "Your system architecture is $ARCH which is unsupported to run Microsoft .NET Core SDK. \nYour OS: $OS \nOS Version: $VER"
	echo
	printf "\e[1;31mPlease check the WizBot self-hosting guide for alternatives.\e[0m\n"
    rm wizbotautoinstaller.sh
	exit 1
fi

if [ "$OS" = "Ubuntu" ]; then
	if [ "$VER" = "12.04" ]; then
		supported=0
	elif [ "$VER" = "14.04" ]; then
		supported=1
	elif [ "$VER" = "16.04" ]; then
		supported=1
	elif [ "$VER" = "16.10" ]; then
		supported=1
	else
		supported=2
	fi
fi

if [ "$supported" = 0 ]; then
	echo -e "Your OS $OS $VER $ARCH looks unsupported to run Microsoft .NET Core. \nExiting..."
    rm wizbotautoinstaller.sh
	exit 1
fi

if [ "$supported" = 2 ]; then
	echo -e "Your OS $OS $VER $ARCH probably can run Microsoft .NET Core. \nContact WizBot's support in Discord with screenshot before continuing..."
	printf "\e[1;31mIf WizBot support staff believe you can run it, Press [y] to continue or [n] to exit.\e[0m\n"
	sleep 10
	while true; do
    read -p "[y/n]: " yn
    case $yn in
        [Yy]* ) clear; echo Okay... Lets go; sleep 2; break;;
        [Nn]* ) echo Exiting...; rm wizbotautoinstaller.sh && exit;;
        * ) echo "Couldn't get that please type [y] for Yes or [n] for No.";;
    esac
	done
fi

echo -e "Welcome to WizBot Auto Prerequisites Installer. \nWould you like to continue? \nYour OS: $OS \nOS Version: $VER \nArchitecture: $ARCH"

while true; do
    read -p "[y/n]: " yn
    case $yn in
        [Yy]* ) clear; echo Running WizBot Auto-Installer; sleep 2; break;;
        [Nn]* ) echo Quitting...; rm wizbotautoinstaller.sh && exit;;
        * ) echo "Couldn't get that please type [y] for Yes or [n] for No.";;
    esac
done

if [ "$OS" = "Ubuntu" ]; then
echo "This installer will download all of the required packages for WizBot. It will use about 350MB of space. This might take awhile to download if you do not have a good internet connection."
echo ""
read -n 1 -s -p "Press any key to continue..."
	if [ "$VER" = "14.04" ]; then
	echo ""
	echo "Preparing..."
	sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
	sudo add-apt-repository ppa:mc3man/trusty-media -y
	sudo add-apt-repository ppa:chris-lea/libsodium -y
	sudo apt update
	sudo apt-get dist-upgrade -y
	echo "Installing Git..."
	sudo apt install git -y
	echo "Installing .NET Core..."
	sudo apt-get install dotnet-dev-1.0.0-preview2.1-003177 -y
	echo "Installing prerequisites..."
	sudo apt install libopus0 opus-tools libopus-dev libsodium-dev ffmpeg tmux -y
	elif [ "$VER" = "16.04" ]; then
	echo ""
	echo "Preparing..."
	sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
	sudo apt-get update
	echo "Installing Git..."
	sudo apt install git -y
	echo "Installing .NET Core..."
	sudo apt-get install dotnet-dev-1.0.0-preview2.1-003177 -y
	echo "Installing prerequisites..."
	sudo apt-get install libopus0 opus-tools libopus-dev libsodium-dev ffmpeg tmux -y
	elif [ "$VER" = "16.10" ]; then
	echo ""
	echo "Preparing..."
	sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ yakkety main" > /etc/apt/sources.list.d/dotnetdev.list'
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
	sudo apt-get update
	echo "Installing Git..."
	sudo apt install git -y
	echo "Installing .NET Core..."
	sudo apt-get install dotnet-dev-1.0.0-preview2.1-003177 -y
	echo "Installing prerequisites..."
	sudo apt-get install libopus0 opus-tools libopus-dev libsodium-dev ffmpeg tmux -y
	fi
elif [ "$OS" = "Debian" ]; then
echo ""
echo "Adding .NET to PATH"
sudo apt-get install curl libunwind8 gettext
curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=835021
sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
sudo ln -s /opt/dotnet/dotnet /usr/local/bin
echo "Installing prerequisites..."
sudo apt-get update
echo "deb http://ftp.debian.org/debian jessie-backports main" | tee /etc/apt/sources.list.d/debian-backports.list
sudo apt-get update && sudo apt-get install ffmpeg -y
sudo apt-get install libopus0 opus-tools libopus-dev libsodium-dev -y
sudo apt install git -y
sudo apt-get install tmux -y
fi

echo
echo "Installation completed..."
sleep 2

tmux new -s wizbot 'rm wizbotautoinstaller.sh && bash linuxAIO.sh'

exit 0