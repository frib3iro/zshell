#!/usr/bin/env bash

# variaveis --------------------------------------------
az='\e[34;1m'
vd='\e[32;1m'
vr='\e[31;1m'
am='\e[33;1m'
fim='\e[m'
seta='\e[32;1m==>\e[m'
# variaveis --------------------------------------------

# ------------------------------------------------------
echo -e "${az}Instalando o zsh${fim}" 
sleep 2s
sudo pacman -S zsh
clear

echo -e "${seta} ${az}Instalando o Oh My Zsh${fim}" 
sleep 2s
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
clear

echo -e "${az}Mudando o bash pelo zsh para $user${fim}" 
sleep 2s
usermod -s /usr/bin/zsh $USER
clear

echo -e "${az}Mudando o bash pelo zsh para o $root${fim}" 
sleep 2s
usermod -s /usr/bin/zsh root
clear

echo -e "${az}Instalando o syntax-highlighting${fim}" 
sleep 2s
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
clear

echo -e "${az}Instalando o Oh My Zsh-autosuggestion${fim}" 
sleep 2s
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
clear

echo -e "${az}Baixando e instalando o fzf${fim}" 
sleep 2s
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
clear

# ------------------------------------------------------
