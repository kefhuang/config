# Ubuntu Mac Settings
Last Modified: 17/06/2024

## System

### Map `CapsLock` to both `Ctrl` AND `Esc`:
```bash
sudo apt install xcape
echo "setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape'" >> ~/.bashrc
```

### 'Always' hide the dock:
```bash
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
```

### Remove Desktop Icon
```bash
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
```

### Natural Scrolling
```bash
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
```

### Chinese Input
```bash
sudo apt install fcitx-bin
sudo apt install fcitx-googlepinyin fcitx-table
```
Then go to settings -> Region & Language -> Manage Installed Languages ->
Keyboard Input method system -> fcitx

Logout and login again

## Packages

Install `git`"
```bash
sudo apt install git
git config --global user.name "kefhuang"
git config --global user.email "kefhuang@outlook.com"
git config --global core.editor vim
```

Install Vim:
```bash
sudo apt install vim
```

Install `zsh`:
```bash
sudo apt install zsh
chsh -s $(which zsh)
```

Install `OhMyZsh`:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Zsh Customize

### Install Pulgins
#### Powerlevel10k
Install Fonts
- [MesloLGS NF Regular.ttf](
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold.ttf](
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
- [MesloLGS NF Italic.ttf](
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
- [MesloLGS NF Bold Italic.ttf](
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Install theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### Syntax Highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### Auto-suggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Load configurations
```bash
rm ~/.zshrc
ln -s `pwd`/configs/zshrc ~/.zshrc
ln -s `pwd`/configs/p10k ~/.p10k.zsh
ln -s `pwd`/configs/vimrc ~/.vimrc
```
