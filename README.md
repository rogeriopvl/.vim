## .vim folder
### Info

This is my `.vim/` folder that contains all the plugins and configurations that I need on vim.

### Install

To install these configs just do a `git clone` in your home directory:

    git clone git://github.com/rogeriopvl/.vim.git

Then run `install.sh` contained inside the repo:

    ./install.sh

This will install vundle, create symlinks if needed,  and call vim with the BundleInstall option to fetch all plugins. If you use syntastic, it will give lots of errors at the end of BundleInstall. Just ignore them, everything will be normal after vim restart.

This script will do the following:

- Fetch and install Vundle (vim plugin manager)
- Create `~/.vimrc` and `~/.gvimrc` symlinks if these files don't exist
- Run vim with `+BundleInstall +qall` to fetch and install all vim/vundle plugins

### Troubleshooting

The syntastic plugin will usually output lots of errors after `BundleInstall`. You can safely ignore theses errors and restart vim. The errors will disapear.
