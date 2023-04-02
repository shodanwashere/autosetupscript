#!/bin/bash

c='\e[32m'
r='tput sgr0'

if [ "$EUID" -ne 0 ]
  then echo -e "${c}We need higher privilege."; $r
  echo -e "${c}You will be asked to input your user password."; $r
fi
sudo apt update
echo -e "${c}Performing upgrade before installing more packages..."; $r
sudo apt upgrade -y
sudo apt install git curl build-essential haskell-platform openjdk-11-jdk valgrind protobuf-compiler protobuf-c-compiler libprotobuf-dev libprotobuf-c-dev -y
echo -e "${c}Installing Discord..."; $r
curl -L "https://discord.com/api/download?platform=linux&format=deb" -o discord.deb
sudo apt install -y ./discord.deb
rm -rf ./discord-*.deb
discord &
echo -e "${c}Installing Anaconda Distribution..."; $r
curl -L "https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh" -o anacondaInstallScript.sh
chmod +x ./anacondaInstallScript.sh
./anacondaInstallScript.sh
echo -e "${c}Installing Steam..."; $r
curl -L "https://repo.steampowered.com/steam/archive/precise/steam_latest.deb" -o steam_latest.deb
sudo apt install ./steam_latest.deb
rm -rf ./steam_latest.deb
echo -e "${c}Installing Visual Studio Code..."; $r
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update && sudo apt install -y code
echo -e "${c}Installing Spotify..."; $r
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -y spotify-client
echo -e "${c}Final Touches..."; $r
sudo apt install -y vim
