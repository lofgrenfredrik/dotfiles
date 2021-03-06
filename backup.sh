#!/bin/zsh

# Files to backup

## Dotfiles
cp ~/.gitconfig  "$DOTFILES_REPO_PATH/"
cp ~/.gitignore_global  "$DOTFILES_REPO_PATH/"
cp ~/.zsh_aliases  "$DOTFILES_REPO_PATH/"
cp ~/.zsh_functions  "$DOTFILES_REPO_PATH/"
cp ~/.zshrc  "$DOTFILES_REPO_PATH/"
cp ~/.zsh/pure/pure.zsh  "$DOTFILES_REPO_PATH/"

## OSX setings
cp ~/osx.sh  "$DOTFILES_REPO_PATH/"

## Brew programs
cp ~/brew.sh  "$DOTFILES_REPO_PATH/"

## SSH config
cp ~/.ssh/config  "$DOTFILES_REPO_PATH/ssh/"

## Backup and status scripts
cp ~/backup.sh  "$DOTFILES_REPO_PATH/"

## Add, commit & push to Github
if [ "$1" ]
then
  cd "$DOTFILES_REPO_PATH/"
  git add .
  git commit -m "$1"
  git push -u origin master
  printf "\033[1;32m*** Backup and pushed to Github ***\033[0m\n"
else
  printf "\033[1;32m*** Backup complete ***\033[0m\n"
fi
