### Checksum
Calculate MD5 checksum:
md5 /tmp/1.iso
Calculate SHA-1 checksum:
shasum -a 1 /tmp/1.iso
Calculate SHA-256 checksum:
shasum -a 256 /tmp/1.iso

### Terminate command:
CTRL + C

### Clear terminal
CMD + K 👉 clears terminal

### Make a new file
cd ~/Desktop/
touch text.txt

### Open dir
Type: `open..` + enter could be `open .`

### Add 2fa to Terminal
1. git clone https://github.com/eonist/SomePrivateRepo.git
2. enter user name
3. enter access token as password (github->settings->dev settings->personal token)

### reset computer
- get ip: terminal `ping name of computer on network`
- terminal `ssh user@ip`
- terminal: `sudo shutdown -r now`

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
