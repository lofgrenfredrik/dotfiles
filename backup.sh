# Files to backup

## Dotfiles
cp ~/.gitconfig  ~/Projects/Repos/dotfiles/
cp ~/.gitignore_global  ~/Projects/Repos/dotfiles/
cp ~/.bash_aliases  ~/Projects/Repos/dotfiles/
cp ~/.bash_profile  ~/Projects/Repos/dotfiles/
cp ~/.zsh_functions  ~/Projects/Repos/dotfiles/
cp ~/.nanorc  ~/Projects/Repos/dotfiles/

## SSH config
cp ~/.ssh/config  ~/Projects/Repos/dotfiles/.ssh/

## oh-my-zsh theme
cp ~/.oh-my-zsh/themes/thor.zsh-theme  ~/Projects/Repos/dotfiles/.oh-my-zsh/themes/

## Backup script
cp ~/backup.sh  ~/Projects/Repos/dotfiles/

## nanorc
cp -Rf ~/nanorc  ~/Projects/Repos/dotfiles/

## Add, commit & push to Github
if [ "$1" ]
then
  cd ~/Projects/Repos/dotfiles
  git add .
  git commit -m "$1"
  git push -u origin master
  printf "\033[1;32m*** Backup and pushed to Github ***\033[0m\n"
else
  printf "\033[1;32m*** Backup complete ***\033[0m\n"
fi
