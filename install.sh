#!/bin/bash

# Atualizar
sudo dnf update -y && sudo dnf upgrade -y

# Instalar o RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalar o Google Chrome (e remover o aviso de gerenciado pela organização)
sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Corrigir os problemas de codec
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer -y
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav ffmpeg

# Instalar grupo de desenvolvimento
sudo dnf groupinstall -y "Development Tools" "Development Libraries"
sudo dnf install -y gcc gcc-c++ make curl wget git openssl-devel zlib-devel bzip2-devel readline-devel sqlite-devel libffi-devel xz-devel

# Configurar Git
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
git config --global core.editor "code --wait"
git config --global init.defaultBranch main

# python
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv install 3.12.4
pyenv global 3.12.4
python --version
pip install --upgrade pip
pip install virtualenv pipx isort mypy ipython

# IDE - VS code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code
code --install-extension ms-python.python ms-python.pylance ms-python.black-formatter ms-python.debugpy eamodio.gitlens oderwat.indent-rainbow

# terminal
sudo dnf install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Edite ~/.zshrc e mude: ZSH_THEME="powerlevel10k/powerlevel10k"
# Reinicie o terminal e siga o assistente de configuração
sudo dnf install -y yakuake

# Utilitarios extras
sudo dnf install -y htop neofetch tree unzip p7zip flameshot

# Instalar as fontes da Microsoft
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Finalize
sudo dnf update -y && reboot
