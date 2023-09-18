#!/bin/sh

git clone --bare https://github.com/Matths2/dotfiles.git $HOME/dotfiles

function dot {
   /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}

mkdir -p .config-backup
dot checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{} && mv -T scripts .config-backup/scripts 2>/dev/null
fi;

dot checkout
dot config status.showUntrackedFiles no
