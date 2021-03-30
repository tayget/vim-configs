# vim-configs

### Installation

#### Install Vim-Plug

###### Unix

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
###### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
#### Install Nodejs-lts

```sh
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
```
```sh
sudo apt-get install -y nodejs
```
#### Install Prettier
```sh
npm install -g prettier
```
### Fix Bracely
```sh
cd ~/.vim/plugged/bracey.vim
```

```sh
npm install --prefix server
```

- Run `:PlugInstall` in vim to install all the Plugins
- Change username in .vimrc for prettier to work
