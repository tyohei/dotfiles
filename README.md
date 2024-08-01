# dotfiles

Dotfiles for macOS.

## [Homebrew](https://brew.sh/)

```sh
brew install \
  git \
  git-secrets \
  zsh-completions \
  bash-completion \
  coreutils \
  jq \
  yq \
  shellcheck \
  bat \
  tree \
  asdf \
  neovim \
  awscli \
  tmux \
  fzf \
  zsh-syntax-highlighting \
  font-hack-nerd-font \
  universal-ctags \
  the_silver_searcher
```

## Git and GitHub

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

```sh
git config --global user.name "[FIRST LAST]"
git config --global user.email "[EMAIL]"
```

## dotfiles

```sh
cd
git clone https://tyohei/dotfiles.git
cd ~/dotfiles/downloads
sh ./download.sh
```

## zshrc and bashrc

```sh
echo "source ~/dotfiles/zsh/zshrc" >> ~/.zshrc
echo "source ~/dotfiles/bash/bashrc" >> ~/.bashrc
```

## Python

```sh
asdf plugin list-all | grep python
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf list all python
asdf install python latest:3.10
asdf global python 3.10.13

python --version

pip install -U \
  pip-search \
  flake8 \
  neovim \
  pynvim \
  jedi \
```

## Node.js

```sh
asdf plugin list-all | grep nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf list all nodejs
asdf install nodejs 20.10.0
asdf global nodejs 20.10.0

node --version
npm --version
```

## Perl

* https://github.com/skaji/cpm

```sh
asdf plugin list-all | grep perl
asdf plugin add perl https://github.com/ouest/asdf-perl.git
asdf list all perl
asdf install perl latest
asdf global perl 5.38.2

perl --version

cpanm Carton
asdf reshim perl
carton --version

curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | perl - install -g App::cpm
asdf reshim perl
cpm --version

# For linting Perl from Vim/NeoVim
cpm install Perl::Tidy
```

## Java

```sh
asdf plugin list-all | grep java
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf list all java
asdf install java adoptopenjdk-17.0.9+9
asdf global java adoptopenjdk-17.0.9+9

java -version
```

## Go

```sh
brew install go

# https://github.com/golang/tools/tree/master/gopls
go install golang.org/x/tools/gopls@latest
```

## Vim

* https://github.com/folke/lazy.nvim

```sh
mkdir -p ~/.vim
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/lua/

echo "source ~/dotfiles/vim/vimrc" >> ~/.vimrc
echo "source ~/dotfiles/vim/ideavimrc" >> ~/.ideavimrc

cd ~/.config/nvim
ln -s ~/dotfiles/vim/init.lua .

cd ~/.config/nvim/lua
ln -s ~/dotfiles/vim/plugins.lua .

mkdir ~/.ctags.d
ln -s ~/dotfiles/ctags/config.ctags ~/.ctags.d/
```

## tmux

* https://github.com/tmux-plugins/tpm

```sh
echo "source ~/dotfiles/tmux/tmux.conf" >> ~/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## LaTeXmk

```sh
ln -s ~/dotfiles/latexmk/latexmkrc ~/.latexmkrc
```

## Karabiner

- https://karabiner-elements.pqrs.org/docs/
- https://karabiner-elements.pqrs.org/docs/json/location/

```sh
cd ~/.config/karabiner/assets/complex_modifications
ln -s ~/dotfiles/karabiner/karabiner.json .
```


## AWS CLI

```sh
mkdir -p ~/.aws/cli
ln -s ~/dotfiles/aws/alias ~/.aws/cli/alias
aws --version
```

## ranger

* https://github.com/ranger/ranger

```sh
ranger
echo 'set colorscheme solarized' >> ~/.config/ranger/rc.conf
```
