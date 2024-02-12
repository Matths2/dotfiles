#!/bin/sh

git clone --bare https://github.com/mattjh1/dotfiles.git $HOME/dotfiles

function dot {
   /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}

mkdir -p $HOME/.config-backup
dot checkout dev

if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
dot checkout dev 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{} && mv -T scripts $HOME/.config-backup/scripts 2>/dev/null
fi;

dot checkout dev
dot config status.showUntrackedFiles no

mkdir -p $HOME/.local/bin

# Create symlinks for scripts
for script in $HOME/scripts/*; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        ln -sfn "$script" "$HOME/.local/bin/$(basename "$script")"
    fi
done


echo "Reload Configuration"
