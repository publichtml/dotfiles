#!/bin/zsh

script_dir=$(cd $(dirname $0) && pwd)

# 独自 runcoms にsymbolic link
for rcfile in "$script_dir"/runcoms/*; do
  ln -s "$rcfile" "$HOME/.${rcfile:t}"
done

# .vimrc.local に symbolic link
cp -n "$script_dir"/local/vimrc.local{.sample,}
ln -s "$script_dir"/local/vimrc.local "$HOME/."vimrc.local
