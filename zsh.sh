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
if sudo pacman -S zsh --noconfirm; then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${azul}Instalando o Oh My Zsh${fim}" 
sleep 2s
if sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"; then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Mudando o bash pelo zsh para $user${fim}" 
sleep 2s
if sudo usermod -s /usr/bin/zsh $USER; then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Mudando o bash pelo zsh para o $root${fim}" 
sleep 2s
if sudo usermod -s /usr/bin/zsh root; then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Instalando o syntax-highlighting${fim}" 
sleep 2s
if git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting; then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Instalando o Oh My Zsh-autosuggestion${fim}" 
sleep 2s
if git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions; then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${azul}Baixando e instalando o fzf${fim}" 
sleep 2s
if git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install; then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

