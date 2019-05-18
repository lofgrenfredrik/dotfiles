# Files to backup

## Dotfiles
cp ~/.gitconfig  ~/Repos/lofgrenfredrik/dotfiles/
cp ~/.gitignore_global  ~/Repos/lofgrenfredrik/dotfiles/
cp ~/.zsh_aliases  ~/Repos/lofgrenfredrik/dotfiles/
cp ~/.zsh_functions  ~/Repos/lofgrenfredrik/dotfiles/
cp ~/.zshrc  ~/Repos/lofgrenfredrik/dotfiles/
cp ~/osx.sh  ~/Repos/lofgrenfredrik/dotfiles/
cp ~/brew.sh  ~/Repos/lofgrenfredrik/dotfiles/

## SSH config
cp ~/.ssh/config  ~/Repos/lofgrenfredrik/dotfiles/.ssh/

## oh-my-zsh
cp ~/oh-my-zsh.sh  ~/Repos/lofgrenfredrik/dotfiles/
cp ~/.oh-my-zsh/themes/thor.zsh-theme  ~/Repos/lofgrenfredrik/dotfiles/.oh-my-zsh/themes/

## Backup and status scripts
cp ~/backup.sh  ~/Repos/lofgrenfredrik/dotfiles/

## Add, commit & push to Github
if [ "$1" ]
then
  cd ~/Repos/lofgrenfredrik/dotfiles
  git add .
  git commit -m "$1"
  git push -u origin master
  printf "\033[1;32m*** Backup and pushed to Github ***\033[0m\n"
else
  printf "\033[1;32m*** Backup complete ***\033[0m\n"
fi
