#!/usr/bin/env bash

# variaveis --------------------------------------------
seta='\e[32;1m--->\e[m'
az='\e[34;1m'
fim='\e[m'
# variaveis --------------------------------------------

# Importar as configuracoes e temas do OhMyZsh para o usuario root
sudo cp /home/$USER/.zshrc /root
sudo cp /home/$USER/.vim /root
sudo cp -r /home/$USER/.oh-my-zsh /root
sudo cp -r /home/$USER/.vimrc /root
sudo sed -i "s/$USER/tempuser/g" /root/.zshrc
sudo sed -i 's#export ZSH="/root/.oh-my-zsh"#export ZSH="/root/.oh-my-zsh"#g' /root/.zshrc
echo -e "${az}OhMyZsh to Root ${seta} Operação concluída${fim}"

