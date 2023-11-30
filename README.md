# (•) files ![colors](https://user-images.githubusercontent.com/24392180/202919385-74f1d901-459c-4e5b-8b84-a8a853ea4d46.png)

## Installation

Install GNU `stow`

```bash
git clone --recursive https://github.com/otuva/dotfiles
cd dotfiles
stow -t ~ git vim zsh # ...
```

For quick start after a clean install:

[Configurations](bootstrap.md)

## TODO

- Perhaps automate bootstrap.md with ansible? or a python script. Using yaml either way
- Sync yaml packages file with new changes. For both flatpak and rpm