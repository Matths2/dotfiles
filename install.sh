#!/bin/sh

git clone --bare https://github.com/mattjh1/dotfiles.git $HOME/dotfiles

function dot {
   /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}

mkdir -p $HOME/.config-backup
dot checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{} && mv -T scripts $HOME/.config-backup/scripts 2>/dev/null
fi;

dot checkout
dot config status.showUntrackedFiles no

echo "Reload Configuration"
