#!/usr/bin/env bash

# variaveis

az='\e[34;1m'
vd='\e[32;1m'
vr='\e[31;1m'
am='\e[33;1m'
seta='\e[32;1m--->\e[m'
fim='\e[m'

# Importar as configuracoes e temas do OhMyZsh para o usuario root
echo -e "${az}Copiando .zshrc para /root${fim}"
sleep 2s
if sudo cp /home/$USER/.zshrc /root; then
    echo -e "${vd}Sucesso${fim}"
else
    echo -e "${vr}Falhou!${fim}"
fi

echo -e "${az}Copiando .vim para /root${fim}"
sleep 2s
if sudo cp -r /home/$USER/.vim /root; then
    echo -e "${vd}Sucesso${fim}"
else
    echo -e "${vr}Falhou!${fim}"
fi


echo -e "${az}Copiando .oh-my-zsh para /root${fim}"
sleep 2s
if sudo cp -r /home/$USER/.oh-my-zsh /root; then
    echo -e "${vd}Sucesso${fim}"
else
    echo -e "${vr}Falhou!${fim}"
fi

echo -e "${az}Copiando o vimrc para /root${fim}"
sleep 2s
if sudo cp /home/$USER/.vimrc /root; then
    echo -e "${vd}Sucesso${fim}"
else
    echo -e "${vr}Falhou!${fim}"
fi

echo -e "${az}Editando o arquivo .zshrc${fim}"
sleep 2s
if sudo sed -i 's#export ZSH="/$USER/.oh-my- zsh"#export ZSH="/root/.oh-my-zsh"#g' /root/.zshrc; then
    echo -e "${vd}Sucesso${fim}"
else
    echo -e "${vr}Falhou!${fim}"
fi

echo -e "${az}OhMyZsh to Root ${seta} Operação concluída${fim}"

