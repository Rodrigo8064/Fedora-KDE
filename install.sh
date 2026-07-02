#!/bin/bash

# Atualizar
sudo dnf update -y && sudo dnf upgrade -y

# Instalar o LinuxToys
# Escolher pacotes a serem instalados: neovim, docker, pyenv, nerdfontes, node, pnpm, google chrome, winboat, rpm fusion
# curl -fsSL https://linux.toys/install.sh | bash

# instalar config do neovim
git clone https://github.com/Rodrigo8064/neovim-config.git ~/.config/nvim

# lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

#lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

#telescope
sudo dnf install -y ripgrep

# Instalar grupo de desenvolvimento
sudo dnf groupinstall -y "Development Tools" "Development Libraries"
sudo dnf install -y gcc gcc-c++ make curl wget git openssl-devel zlib-devel bzip2-devel readline-devel sqlite-devel libffi-devel xz-devel

# Configurar Git
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
git config --global core.editor "nvim"
git config --global init.defaultBranch main

# terminal
sudo dnf install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Edite ~/.zshrc e mude: ZSH_THEME="powerlevel10k/powerlevel10k"
# Reinicie o terminal e siga o assistente de configuração

# Utilitarios extras
sudo dnf install -y btop neofetch tree unzip p7zip fd-find
npm install -g neovim

# Finalize
sudo dnf update -y && reboot
