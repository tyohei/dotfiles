# Dotfiles

Dotfiles for macOS and Linux

## 1. Install [Homebrew](https://brew.sh/)

## 2. Install Git and Other Tools

```sh
brew install \
  git \
  git-secrets \
  zsh-completions \
  bash-completion \
  coreutils \
  jq \
  yq
```

## 3. Setup Git

```sh
git config --global user.name "[FIRST LAST]"
git config --global user.email "[EMAIL]"
```

## 4. Clone/Download Files

```sh
cd
git clone https://tyohei/dotfiles.git
cd ~/dotfiles/downloads
sh ./download.sh
```

### 5. Setup Zsh and Bash

```sh
echo "source ~/dotfiles/zsh/zshrc" >> ~/.zshrc
echo "source ~/dotfiles/bash/bashrc" >> ~/.bashrc
```

## 6. Install pyenv

```sh
brew install pyenv
pyenv install -l
pyenv install 3.9.10
pyenv global 3.9.10
```

## 7. Setup Python

```sh
pip install -U \
  pip-search \
  flake8 \
  neovim \
  pynvim \
  cfn-lint \
  jedi
```

## 8. Vim/Neovim

- https://github.com/Shougo/dein.vim

```sh
brew install neovim
brew install go

mkdir -p ~/.vim
echo "source ~/dotfiles/vim/vimrc" >> ~/.vimrc

mkdir -p ~/.config/nvim/
echo "source ~/dotfiles/vim/init.vim" >> ~/.config/nvim/init.vim

cd ~/dotfiles/downloads/
sh ./installer.sh ~/.cache/dein
```

## 9. Tmux

```sh
echo "source ~/dotfiles/tmux/tmux.conf" >> ~/.tmux.conf
```

## 10. LaTeXmk

```sh
ln -s ~/dotfiles/latexmk/latexmkrc ~/.latexmkrc
```

## 11. Karabiner

- https://karabiner-elements.pqrs.org/docs/

```sh
cd ~/.config/karabiner/assets/complex_modifications
ln -s ~/dotfiles/karabiner/karabiner.json .
```

## 12. AWS CLI and AWS SAM CLI

- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-mac.html

```sh
brew install awscli
mkdir -p ~/.aws/cli
ln -s ~/dotfiles/aws/alias ~/.aws/cli/alias
```
