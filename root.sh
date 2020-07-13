#!/usr/bin/env bash

# variaveis

azul='\e[34;1m'
verde='\e[32;1m'
vermelho='\e[31;1m'
amarelo='\e[33;1m'
seta='\e[32;1m--->\e[m'
fim='\e[m'

# Importar as configuracoes e temas do OhMyZsh para o usuario root
echo -e "${azul}Copiando .zshrc para /root${fim}"
sleep 2s
if sudo cp /home/$USER/.zshrc /root; then
    echo -e "${verde}Sucesso${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Copiando .vim para /root${fim}"
sleep 2s
if sudo cp -r /home/$USER/.vim /root; then
    echo -e "${verde}Sucesso${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Copiando .oh-my-zsh para /root${fim}"
sleep 2s
if sudo cp -r /home/$USER/.oh-my-zsh /root; then
    echo -e "${verde}Sucesso${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Copiando o vimrc para /root${fim}"
sleep 2s
if sudo cp /home/$USER/.vimrc /root; then
    echo -e "${verde}Sucesso${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Editando o arquivo .zshrc${fim}"
sleep 2s
if sudo sed -i 's#export ZSH="/home/fabio/.oh-my-zsh"#export ZSH="/root/.oh-my-zsh"#g' /root/.zshrc; then
    echo -e "${verde}Sucesso${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}OhMyZsh to Root ${seta} Operação concluída${fim}"

