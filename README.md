# Dotfiles

First do following in this repository:
HomeBrew:
- git
- git-secrets
- neovim
- coreutils
- pyenv
- zsh-completions
- bash-completion
- awscli

## 1. Download Files

```
$ sh ./download.sh
```

## 2. Vim/Neovim

- https://github.com/Shougo/dein.vim

```sh
mkdir -p ~/.vim
echo "source ~/dotfiles/vim/vimrc" >> ~/.vimrc

mkdir -p ~/.config/nvim/
echo "source ~/dotfiles/vim/init.vim" >> ~/.config/nvim/init.vim

cd ~/dotfiles/downloads/
sh ./installer.sh ~/.cache/dein

pip install -U neovim
pip install -U pynvim
pip install -U cfn-lint
pip install -U jedi
```


## 3. Bash

```sh
echo "source ~/dotfiles/bash/bashrc" >> ~/.bashrc
```

## 4. Zsh

```sh
echo "source ~/dotfiles/zsh/zshrc" >> ~/.zshrc
```

## 5. Tmux

```sh
echo "source ~/dotfiles/tmux/tmux.conf" >> ~/.tmux.conf
```

## 6. LaTeXmk

```sh
ln -s ~/dotfiles/latexmk/latexmkrc ~/.latexmkrc
```

## 7. Karabiner

- https://karabiner-elements.pqrs.org/docs/

```sh
cd ~/.config/karabiner/assets/complex_modifications
ln -s ~/dotfiles/karabiner.json .
```

## 8. AWS CLI

```sh
mkdir -p ~/.aws/cli
ln -s ~/dotfiles/aws/alias ~/.aws/cli/alias
```
