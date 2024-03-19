#!/bin/bash
set -eu

mkdir -p downloads

curl \
  https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark \
  -o downloads/dircolors.ansi-dark

curl \
  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
  -o downloads/git-completion.bash

curl \
  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh \
  -o downloads/git-completion.zsh

curl \
  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
  -o downloads/git-prompt.sh

curl \
  https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh \
  -o downloads/bash-preexec.sh

curl \
  https://raw.githubusercontent.com/99designs/aws-vault/master/contrib/completions/zsh/aws-vault.zsh \
  -o downloads/aws-vault.zsh
