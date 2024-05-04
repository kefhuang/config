# Mac Settings
Last Modified: 04/05/2024

## System

### Map `CapsLock` to both `Ctrl` AND `Esc`:
1. Download and Install [Karabiner
   Elements](https://karabiner-elements.pqrs.org/)
2. Import complex modifications [Caps Lock to Esc, Ctrl and
   Numpad](https://ke-complex-modifications.pqrs.org/#CapsLockToEscCtrlNumPad)
3. Enable the option

### 'Always' hide the dock:
1. Enable autohide dock in settings and 
2. Set the delay to 2 seconds so the dock is still accessible when needed
     ```bash
     defaults write com.apple.dock autohide-delay -float 2; killall Dock
     ```
3. To get the dock back 
     ```bash
     defaults delete com.apple.dock autohide-delay; killall Dock
     ```

## Packages

Install `Homebrew`:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install `OhMyZsh`:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install `git`"
```bash
brew install git
git config --global user.name "kefhuang"
git config --global user.email "kefhuang@outlook.com"
git config --global core.editor vim
```

Install `PHP`:
MacOS does not comes with php natively anymore
```bash
brew install php
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
ln -s `pwd`/configs/zshrc ~/.zshrc
ln -s `pwd`/configs/p10k ~/.p10k.zsh
ln -s `pwd`/configs/vimrc ~/.vimrc
```

## Alfred
Full Alfred Settings can be found [here](./alfred/Alfred.alfredpreferences/)

1. Using `iTerm 2` instead of system terminal:
   ```
   -- This is v0.7 of the custom script for AlfredApp for iTerm 3.1.1+
   -- created by Sinan Eldem www.sinaneldem.com.tr

   on alfred_script(q)
      if application "iTerm2" is running or application "iTerm" is running then
         run script "
            on run {q}
               tell application \"iTerm\"
                  activate
                  try
                     select first window
                     set onlywindow to true
                  on error
                     create window with default profile
                     select first window
                     set onlywindow to true
                  end try
                  tell the first window
                     if onlywindow is false then
                        create tab with default profile
                     end if
                     tell current session to write text q
                  end tell
               end tell
            end run
         " with parameters {q}
      else
         run script "
            on run {q}
               tell application \"iTerm\"
                  activate
                  try
                     select first window
                  on error
                     create window with default profile
                     select first window
                  end try
                  tell the first window
                     tell current session to write text q
                  end tell
               end tell
            end run
         " with parameters {q}
      end if
   end alfred_script
   ```
2. Added some custome [websearch](./alfred/Alfred.alfredpreferences/preferences/features/websearch/prefs.plist)

   
