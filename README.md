# .config

## ZSH
```
echo 'if [ -f ~/.zshrc.common ]; then
    source ~/.zshrc.common
fi' >> .zshrc
```

## Wezterm

1. Make sure the env HOME and XDG_CONFIG_HOME env var are set

to home or home/.config

2. link wezterm.lua to XDG_CONFIG_HOME/wezterm/wezterm.lua