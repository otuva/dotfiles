# system (•) files ![colors](https://user-images.githubusercontent.com/24392180/202919385-74f1d901-459c-4e5b-8b84-a8a853ea4d46.png)


## Installation

```
# stow -t / profile pacman ...
```

## Notes

- [For nvidia - Preserve video memory after suspend](https://wiki.archlinux.org/title/NVIDIA/Tips_and_tricks#Preserve_video_memory_after_suspend)

- Environment is for gnome 

- After editing system configs make sure to chown root

    ```
    tfp@archlinux  ~/Dev/etc/dotfiles   main 
    ➜ sudo chown -R $(whoami):$(whoami) _system
    ```
    
    *Do some editing...*

    ```
    tfp@archlinux  ~/Dev/etc/dotfiles   main 
    ➜ sudo chown -R root:root _system                                      
    ```

