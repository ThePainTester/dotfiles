# ⚙️ Dotfiles

This are my dotfiles for my arch linux system with hyprland.

## Steps

1. Clone the repo
```bash
git clone https://github.com/ThePainTester/dotfiles.git ~/dotfiles
```
2. Add a global `zshenv`
```bash
sudo tee /etc/zsh/zshenv >/dev/null <<'EOF'
if [[ -z "$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$ZDOTDIR" && -d "$XDG_CONFIG_HOME/zsh" ]]
then
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
EOF
```
3. Symlink the dotfiles with GNU stow
```bash
stow ~/dotfiles
```
