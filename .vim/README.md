# Setup
## Clone this repository
```
git clone --bare git@github.com:wahlencraft/vim-config.git $HOME/.cfg-vim
/usr/bin/git --git-dir=$HOME/.cfg-vim/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.cfg-vim/ --work-tree=$HOME checkout HEAD ~
```
Add alias to `.bashrc` or wherever you keep aliases:
```
alias cfg-vim='/usr/bin/git --git-dir=$HOME/.cfg-vim/ --work-tree=$HOME'
```
## Download plugins
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Open vim and run the following commands
```
:source ~/.vimrc
:PlugInstall
```
