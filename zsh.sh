#!/usr/bin/env bash

# variaveis --------------------------------------------
azul='\e[34;1m'
verde='\e[32;1m'
vermelho='\e[31;1m'
amarelo='\e[33;1m'
fim='\e[m'
seta='\e[32;1m==>\e[m'

# ------------------------------------------------------
echo -e "${azul}Instalando o zsh${fim}" 
sleep 2s
sudo pacman -S zsh
clear

echo -e "${seta} ${azul}Instalando o Oh My Zsh${fim}" 
sleep 2s
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
clear

echo -e "${azul}Mudando o bash pelo zsh para $user${fim}" 
sleep 2s
sudo usermod -s /usr/bin/zsh $USER
clear

echo -e "${azul}Mudando o bash pelo zsh para o $root${fim}" 
sleep 2s
sudo usermod -s /usr/bin/zsh root
clear

echo -e "${azul}Instalando o syntax-highlighting${fim}" 
sleep 2s
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
clear

echo -e "${azul}Instalando o Oh My Zsh-autosuggestion${fim}" 
sleep 2s
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
clear

echo -e "${azul}Baixando e instalando o fzf${fim}" 
sleep 2s
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
clear

