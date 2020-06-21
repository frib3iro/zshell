#!/usr/bin/env bash

# variaveis --------------------------------------------
az='\e[34;1m'
vd='\e[32;1m'
vr='\e[31;1m'
am='\e[33;1m'
fim='\e[m'
seta='\e[32;1m==>\e[m'

echo -e "${az}Instalando o zsh${fim}" 
sudo pacman -Sy zsh

echo -e "${seta} ${az}Instalando o Oh My Zsh${fim}" 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "${az}Mudando o bash pelo zsh para $user${fim}" 
usermod -s /usr/bin/zsh fabio
echo -e "${az}Mudando o bash pelo zsh para o $root${fim}" 
usermod -s /usr/bin/zsh root

echo -e "${az}Instalando o syntax-highlighting${fim}" 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo -e "${az}Instalando o Oh My Zsh-autosuggestion${fim}" 
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

echo -e "${az}Baixando e instalando o fzf${fim}" 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# ---------------------------------------------------------------------

# Importar as configuracoes e temas do OhMyZsh para o usuario root
sudo cp /home/$USER/.zshrc /root
sudo cp -r /home/$USER/.oh-my-zsh /root
sudo sed -i "s/$USER/tempuser/g" /root/.zshrc
sudo sed -i 's#export ZSH="/home/tempuser/.oh-my-zsh"#export ZSH="/root/.oh-my-zsh"#g' /root/.zshrc
echo "OhMyZsh to Root ---> Operação concluída."

