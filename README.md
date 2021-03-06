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
  yq \
  amazon-workspaces \
  shellcheck
```

## 3. Setup Git and GitHub

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

```sh
git config --global user.name "[FIRST LAST]"
git config --global user.email "[EMAIL]"
```

```sh
ssh-keygen -t ed25519 -C "[EMAIL]"
cat << EOF >> ~/.ssh/config
Host github
  HostName github.com
  User git
  IdentityFile ~/.ssh/[FILE PATH]
EOF
```

Then add you public key to GitHub.

```sh
ssh github
# Hi <NAME>! You've successfully authenticated, but GitHub does not provide shell access.
Connection to github.com closed.
```

## 4. Clone/Download Files

```sh
cd
git clone https://tyohei/dotfiles.git
cd ~/dotfiles/downloads
sh ./download.sh
```

## 5. Setup Zsh and Bash

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
  jedi \
  jupyterlab \
  matplotlib
```

## 8. Vim/Neovim/IdeaVim

- https://github.com/Shougo/dein.vim

```sh
brew install neovim
brew install go

mkdir -p ~/.vim
echo "source ~/dotfiles/vim/vimrc" >> ~/.vimrc

mkdir -p ~/.config/nvim/
echo "source ~/dotfiles/vim/init.vim" >> ~/.config/nvim/init.vim

echo "source ~/dotfiles/vim/ideavimrc" >> ~/.ideavimrc

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

## 12. Node.js

- https://github.com/nvm-sh/nvm

```sh
nvm --version
nvm install --lts
nvm install --lts=Fermium
nvm list
nvm alias default

node --version
npm --version
npm list -g --depth=0
npm install -g typescript
```

## 12. AWS CLI, AWS SAM CLI, AWS CDK Toolkit, AWS Amplify CLI, and Rain

- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-mac.html
- https://docs.aws.amazon.com/cdk/v2/guide/cli.html
- https://docs.amplify.aws/cli/start/install/
- https://github.com/aws-cloudformation/rain

```sh
brew install awscli
mkdir -p ~/.aws/cli
ln -s ~/dotfiles/aws/alias ~/.aws/cli/alias
aws --version

brew tap aws/tap
brew install aws-sam-cli
sam --version

npm install -g aws-cdk
ln -s ~/dotfiles/aws/cdk.json ~/.cdk.json
cdk --version

npm install -g @aws-amplify/cli
amplify --version

brew install rain
```
