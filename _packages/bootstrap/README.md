Install yay

- `pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`

Clone dotfiles

- `mkdir -p ~/Dev/etc && cd ~/Dev/etc`
- `git clone https://github.com/otuva/dotfiles && cd dotfiles`

Install packages

- `yay -S - < _packages/bootstrap/base.txt`

If on gnome, install gnome specific packages too

- `yay -S - < _packages/bootstrap/gnome_only.txt`

Gnome settings

- Dump:
    - `dconf dump / > gnome_settings.txt`
- Load
    - `dconf load / < gnome_settings.txt`

Add your archive.org api key to secret-tool

- `secret-tool store --label "Wayback - accesskey" wayback accesskey`
- `secret-tool store --label "Wayback - secretkey" wayback secretkey`

```
sudo rm /etc/environment /etc/pacman.conf /etc/profile
mkdir -p ~/.local/state/zsh/
rm ~/.*
```
