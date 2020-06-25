#!/usr/bin/env bash

# variaveis
seta='\e[32;1m--->\e[m'
az='\e[34;1m'
fim='\e[m'

# Importar as configuracoes e temas do OhMyZsh para o usuario root
echo -e "${az}Copiando .zshrc para /root${fim}"
sleep 2s
[ sudo cp /home/$USER/.zshrc /root ] && echo "Sucesso" || echo "Falhou!"

echo -e "${az}Copiando .vim para /root${fim}"
sleep 2s
[ sudo cp -r /home/$USER/.vim /root ] && echo "Sucesso" || echo "Falhou!"

echo -e "${az}Copiando .oh-my-zsh para /root${fim}"
sleep 2s
[ sudo cp -r /home/$USER/.oh-my-zsh /root ] && echo "Sucesso" || echo "Falhou!"

echo -e "${az}Copiando o vimrc para /root${fim}"
sleep 2s
[ sudo cp /home/$USER/.vimrc /root ] && echo "Sucesso" || echo "Falhou!"

echo -e "${az}Editando o arquivo .zshrc${fim}"
sleep 2s
[ sudo sed -i 's#export ZSH="/$USER/.oh-my- zsh"#export ZSH="/root/.oh-my-zsh"#g' /root/.zshrc ] && echo "Sucesso" || echo "Falhou!"

echo -e "${az}OhMyZsh to Root ${seta} Operação concluída${fim}"

