# dotfiles(H)

This directory is where I keep the dotfiles for my system. Plan to add a script to further automate the process in the future. 

## Requirements

Ensure you have the following installed on your system:

# On arch:
```
sudo pacman -Syy && pacman -S git stow
```

```
# On debian based:
```
sudo apt install git
```

```
sudo apt update && sudo apt install stow
```

## Installation

If you need a refresher, check out this [video](https://www.youtube.com/watch?v=y6XCebnB9gs)

First clone the dotfiles repo to your $HOME directory via git

```
git clone https://github.com/w4r-h0und/dotfiles.git $HOME

cd ~/dotfiles
```

then use GNU stow to create symlinks to the appropriate locations

```
stow .
```


