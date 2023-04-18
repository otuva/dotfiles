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

Patch agnoster theme prompt

- `sudo sed -i 's,echo -n "%{%f%}",echo -n "\\e[m\\n\E2\9E\9C%{%f%}",g' /usr/share/oh-my-zsh/themes/agnoster.zsh-theme`

```
#End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  printf "\n ➜";
  CURRENT_BG=''
}
```

```
sudo rm /etc/environment /etc/pacman.conf /etc/profile
mkdir -p ~/.local/state/zsh/
rm ~/.*
```
