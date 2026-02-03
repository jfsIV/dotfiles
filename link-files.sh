REBUILD_DIR=~/projects/rebuild-computer

ln -sf $REBUILD_DIR/user-dirs.dirs ~/.config/user-dirs.dirs
ln -sf $REBUILD_DIR/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $REBUILD_DIR/bashrc ~/.bashrc

ln -sfP $REBUILD_DIR/neovim-config ~/.config/nvim
ln -sfP $REBUILD_DIR/hypr ~/.config/hypr
