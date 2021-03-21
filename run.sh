#!/usr/bin/env bash
set -e

#### functions and tasks ##############################################################

function make_symlink {
  local source=$1
  local destination=$2
  if [ -h "$destination" ]; then
    return 0
  elif [ -f "$destination" ]; then
    echo "File exists: ${destination}"
  else
    ln -sv "$(pwd)"/"$source" "$destination"
  fi
}

function task_setup_bash {
  make_symlink dotfiles/shell/bashrc ~/.bashrc
  make_symlink dotfiles/shell/bash_aliases ~/.bash_aliases
}

function task_setup_vim {
  # install neovim:
  sudo apt-get install neovim

  # vim and neovim dotfiles and color scheme:
  mkdir -p ~/.config/nvim/colors
  cp dotfiles/vim/plugin/gruvbox.vim ~/.config/nvim/colors/
  make_symlink dotfiles/vim/vimrc ~/.vimrc
  make_symlink dotfiles/vim/vimrc ~/.config/nvim/init.vim

  # make neovim your default git editor:
  git config --global core.editor "nvim"
 }

function task_setup_vscode {
  sudo apt update
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt update
  sudo apt install code
}


#### name tasks and task usage ########################################################

task_usage() {
  echo "Usage: ./run.sh setup-bash | setup-vim | setup-code"
  exit 1
}
cmd=$1
shift || true
case "$cmd" in
  lint) linting ;;
  setup-bash) task_setup_bash ;;
  setup-vim) task_setup_vim ;;
  setup-code) task_setup_vscode ;;
  *)     task_usage ;;
esac
