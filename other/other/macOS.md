## unhide hidden files:
the opposite is ``NO``
```bash
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder
```

## hide desktop:

```bash
defaults write com.apple.finder CreateDesktop false; killall Finder
defaults write com.apple.finder CreateDesktop true; killall Finder
```

### Force empty trashbin

```bash
sudo rm -rf ~/.Trash
sudo rm -rf /Volumes/*/.Trashes
```
