## Dot Files
These are some dot files (like .git, config.fish) that I want to keep track and replicate on other computers.

The more useful portion is the configuraton for [fish shell](http://fishshell.com/).

IMPORTANT: To get the full effect of the fish shell prompt you'll need Powerline Fonts. I've used [these](https://github.com/powerline/fonts) and settled with Menlo for now.

### Fish dotfiles install

1. Remove/Rename the previous `~/.config/fish` directory
2. Setup `~/.config/fish` to point to the fish directory in this repo: `dotfiles/xdg_config_home/fish`
```
ln -s ./dotfiles/xdg_config_home/fish ~/.config/fish
```
