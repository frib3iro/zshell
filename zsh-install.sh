#!/usr/bin/env bash

# variaveis --------------------------------------------
az='\e[34;1m'
vd='\e[32;1m'
vr='\e[31;1m'
am='\e[33;1m'
fim='\e[m'
seta='\e[32;1m==>\e[m'

[[ "$UID" -ne '0' ]] && { echo -e "${vr}Logue-se como root${fim}"; exit 1;}

echo -e "${az}Instalando o zsh${fim}"                                                              
echo $pass_user | sudo -S sudo pacman -S zsh

echo -e "${seta} ${az}Instalando o Oh My Zsh${fim}"                                                              
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# echo -e "${az}Testar o comando abixo $user${fim}"                                                              
# sudo chsh -s /usr/bin/zsh

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

# Copie o arquivo ".zshrc" para o diretório "/root".
echo -e "${az}Copiando o arquivo \".zshrc\" para o diretório \"/root\"${fim}"
cp /home/$USER/.zshrc /root

# Copie a pasta ".oh-my-zsh" para o diretório "/root":
echo -e "${az}Copiando a pasta \".oh-my-zsh\" para o diretório \"/root\"${fim}" 
cp -r /home/$USER/.oh-my-zsh /root

# # Edite o arquivo ".zshrc" que está no diretório "/root":
# echo -e "${az}Editando o arquivo \".zshrc\" que está no diretório \"/root\"${fim}" 
# echo $pass_user | sudo -S vim /root/.zshrc

# Cole a linha abaixo dentro do arquivo ".zshrc", de forma que fique igual a imagem abaixo:
echo -e "${az}Substituindo a linha \"export ZSH=\"/root/.oh-my-zsh\"\" abaixo dentro do arquivo \".zshrc\"${fim}" 
sed -i 's/export ZSH="/home/fabio/.oh-my-zsh"/export ZSH="/root/.oh-my-zsh"/' /root/.zshrc

