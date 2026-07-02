#!/bin/bash

# python
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc
pyenv install 3.13.13
pyenv global 3.13.13
python --version
pip install --upgrade pip
pip install virtualenv pipx isort mypy ipython
pipx ensurepath
pipx install poetry
pipx upgrade-all
poetry config virtualenvs.in-project true

# zuban
pip install zuban

#neovim
pip install neovim

# Atualizar
sudo dnf update -y && sudo dnf upgrade -y
