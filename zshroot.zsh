#!/usr/bin/env zsh

# Importar as configuracoes e temas do OhMyZsh para o usuario root
sudo cp /home/$USER/.zshrc /root
sudo cp -r /home/$USER/.oh-my-zsh /root
sudo sed -i "s/$USER/tempuser/g" /root/.zshrc
sudo sed -i 's#export ZSH="/home/tempuser/.oh-my-zsh"#export ZSH="/root/.oh-my-zsh"#g' /root/.zshrc
cp -r .vimrc /root
cp -r .vim /root
echo "OhMyZsh to Root ---> Operação concluída."

