# dotfiles

My dotfiles, inspired on [riethmayer](https://github.com/riethmayer) [dotfiles](https://github.com/riethmayer/dotfiles).

## Installation
Clone the dotfiles repository to your target dotfiles directory.

    mkdir -p $HOME/projects
    git clone git@github.com:patriciagarcia/dotfiles $HOME/projects/dotfiles

Then edit your `$HOME/.bashrc` file to look like this:

    # $HOME/.bashrc
    export DOTFILES_DIR=$HOME/src/dotfiles
    source $DOTFILES_DIR/bash/env
    source $DOTFILES_DIR/bash/aliases

And your `$HOME/.bash_profile` file to look like this:

    # $HOME/.bash_profile
    source $HOME/.bashrc

Your config files and scripts within bin are linked automatically.
