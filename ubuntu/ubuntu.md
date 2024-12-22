# Ubuntu Setup
Last Modified: 29/11/2024

## Automated Scripts

```
bash ubuntu/setup.sh
```

# Step by Step

1. Install Drivers

```
sudo apt update
sudo apt install nvidia-driver-550
```

Now `reboot`

2. Installing Essential Apps
```
sudo apt install curl
```

* Chrome
* 1Password
```
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/ curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password
```
Source: https://support.1password.com/install-linux/#debian-or-ubuntu

* Dropbox

* VSCode


3. Install Zsh
```
sudo apt install zsh
```

4. Import SystemConfig

## System

### Modify Keyboard
Install `xcape`
```bash
sudo apt install xcape
```

```
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

## Software Install


# Windows Management

```
sudo apt install gnome-tweaks gnome-shell-extensions
```

save gtile config
```
dconf dump /org/gnome/shell/extensions/gtile/ > my-custom-gtile-configs.conf
```


load gtile config
```
dconf load /org/gnome/shell/extensions/gtile/ < my-custom-gtile-configs.conf
```
