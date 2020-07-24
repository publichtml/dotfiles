#!/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB

script_dir=$(cd $(dirname $0) && pwd)

# 独自runcomsにsymbolic link
for rcfile in "$script_dir"/runcoms/*; do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# zpreztoのruncomsにsymbolic link (上で既に作られたものは上書きされない)
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

cp -n "$script_dir"/local/zshrc.local{.sample,}
ln -s "$script_dir"/local/zshrc.local "${ZDOTDIR:-$HOME}/."zshrc.local
