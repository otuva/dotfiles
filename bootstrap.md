---

---

---

---

- [Commands to run](#commands-to-run)
  * [Create dir for zsh history](#create-dir-for-zsh-history)
  * [Add your archive.org api key to secret-tool](#add-your-archiveorg-api-key-to-secret-tool)
- [/etc](#-etc)
  * [Environment variables for xdg](#environment-variables-for-xdg)
  * [Python history xdg](#python-history-xdg)
  * [ZRAM](#zram)
  * [SYSRQ](#sysrq)
- [Flatpak app configs](#flatpak-app-configs)
  * [Ungoogled Chromium](#ungoogled-chromium)
  * [Generic Electron Apps](#generic-electron-apps)
  * [VS Code git](#vs-code-git)
- [Gnome](#gnome)
  * [Weather app top bar set centigrade](#weather-app-top-bar-set-centigrade)
  * [Sort apps alphabetically](#sort-apps-alphabetically)
  * [Legacy apps dark mode](#legacy-apps-dark-mode)
  * [Extensions](#extensions)
- [Fedora Silverblue](#fedora-silverblue)
  * [Packages](#packages)
  * [Flatpaks](#flatpaks)

---

---

---

---

### Commands to run

#### Create dir for zsh history

- `mkdir -p ~/.local/state/zsh`

#### Add your archive.org api key to secret-tool

- `secret-tool store --label "Wayback - accesskey" wayback accesskey`
- `secret-tool store --label "Wayback - secretkey" wayback secretkey`

### /etc

#### Environment variables for xdg

Append to */etc/zprofile*
```bash
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export ZDOTDIR="${HOME}/.config/zsh"
export VIMINIT="set nocp | source ${XDG_CONFIG_HOME}/vim/vimrc"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export SQLITE_HISTORY="${XDG_STATE_HOME}/sqlite_history"
export PARALLEL_HOME="${XDG_CONFIG_HOME}/parallel"
export PYTHONSTARTUP="/etc/python/pythonrc"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_repl_history"
export KERAS_HOME="${XDG_STATE_HOME}/keras"
```

#### Python history xdg 

*/etc/python/pythonrc*
```python
import os
import atexit
import readline
from pathlib import Path

if readline.get_current_history_length() == 0:
    state_home = os.environ.get("XDG_STATE_HOME")
    if state_home is None:
        state_home = Path.home() / ".local" / "state"
    else:
        state_home = Path(state_home)

    history_path = state_home / "python_history"
    if history_path.is_dir():
        raise OSError(f"'{history_path}' cannot be a directory")

    history = str(history_path)

    try:
        readline.read_history_file(history)
    except OSError:  # Non existent
        pass

    def write_history():
        try:
            readline.write_history_file(history)
        except OSError:
            pass

    atexit.register(write_history)
```

#### ZRAM

*/etc/systemd/zram-generator.conf*
```
[zram0]
zram-size = ram
compression-algorithm = zstd
swap-priority = 100
fs-type = swap
```

#### SYSRQ

*/etc/sysctl.d/90-sysrq.conf*
```
kernel.sysrq = 1
```


### Flatpak app configs

#### Ungoogled Chromium

*~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium-flags.conf*
```
--ozone-platform-hint=wayland
--enable-features=WaylandWindowDecorations,WebUIDarkMode 
--force-dark-mode
```

#### Generic Electron Apps

*electron-flags.conf*
```
--enable-features=WaylandWindowDecorations
--ozone-platform-hint=wayland
```

#### VS Code git

*~/.var/app/com.visualstudio.code/config/git/config*

[Copy this](git/.config/git/config)

### Gnome

#### Weather app top bar set centigrade

```
gsettings set org.gnome.GWeather4 temperature-unit "'centigrade'"
```

#### Sort apps alphabetically

```
gsettings set org.gnome.shell app-picker-layout "[]"
```

#### Legacy apps dark mode

```
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
```

#### Extensions

- background-logo@fedorahosted[.]org
- dash-to-dock@micxgx[.]gmail[.]com
- appindicatorsupport@rgcjonas[.]gmail[.]com
- just-perfection-desktop@just-perfection
- pano@elhan[.]io
- caffeine@patapon[.]info
- gsconnect@andyholmes[.]github[.]io

### Fedora Silverblue

#### Packages

- **RemovedBasePackages:** firefox firefox-langpacks 120.0-3.fc39 gnome-tour 45.0-1.fc39 yelp 2:42.2-4.fc39
- **LayeredPackages:** akmod-nvidia bat duf eza fd-find gnome-themes-extra gnome-tweaks kernel-tools libgda libgda-sqlite lm_sensors nautilus-python neofetch numix-icon-theme-circle ripgrep stow virt-manager xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda zsh zsh-autosuggestions zsh-syntax-highlighting

#### Flatpaks

- **Installed:** com.github.Eloston.UngoogledChromium com.github.tchx84.Flatseal com.mattjakeman.ExtensionManager com.usebottles.bottles com.valvesoftware.Steam com.visualstudio.code io.github.slgobinath.SafeEyes io.gitlab.librewolf-community io.mpv.Mpv org.gnome.Calculator org.gnome.Calendar org.gnome.Cheese org.gnome.Connections org.gnome.Evince org.gnome.Extensions org.gnome.Logs org.gnome.Loupe org.gnome.NautilusPreviewer org.gnome.SoundRecorder org.gnome.TextEditor org.gnome.Weather org.gnome.baobab org.gnome.clocks org.gnome.font-viewer org.libreoffice.LibreOffice org.mozilla.Thunderbird org.nickvision.tubeconverter org.qbittorrent.qBittorrent org.telegram.desktop