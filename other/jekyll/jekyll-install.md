### Terminal (installing jekyl software) (old way)
1. `ruby -v` (check if you have ruby installed)
2. `gem -v` (check if you have gem installed)
3. `sudo install jekyll bundler`  (installs Jekyll) (type your admin password) seems we use: `sudo gem install bundler jekyll` now days. seems like we have to have xcode `xcode-select --install`
4. `jekyll new test_website` (makes jekyll website in user dir)
5. `cd  /Users/eon/test_website` (move to directory)
6. `bundle exec jekyll serve` or sometimes: `jekyll serve` (serves up the website at: http://127.0.0.1:4000/) (see jekyll-commands.md for more custom serve calls)

### New way to install:
Instructions: https://jekyllrb.com/docs/installation/macos/

1. terminal: install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` (this also downloads and installs xcode command line tools)
2. Run these two commands in your terminal to add Homebrew to your PATH:
    `(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/eon/.bash_profile`
    and `eval "$(/opt/homebrew/bin/brew shellenv)"`
3. `brew install chruby ruby-install`
4. `ruby-install ruby` (⚠️️ using ruby-install ruby 3.1.3 fails ⚠️️) this could be why: It’s important to make sure you can install the latest Ruby before trying to install other Ruby versions.
5. add paths to your profile: (use `echo $0` to find your profile) f you’re using Bash, replace .zshrc with .bash_profile. If you’re not sure, read [this](https://www.moncefbelyamani.com/which-shell-am-i-using-how-can-i-switch/) external guide to find out which shell you’re using. 
6.  run `'chruby'` to see actual version
7. Add the following lines to your shell configuration file (Apple silicon M1/M2) (⚠️️ very important to set the right ruby version ⚠️️)
`
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile
echo "chruby ruby-3.3.5" >> ~/.bash_profile
`
8. check ruby version: `ruby -v`
9. install gem `gem install` or sometimes: `gem update --system 3.5.18`
10. Install Jekyll `gem install jekyll`
11. install he default theme for websites: `gem install minima`


### Gotchas
- System ruby is outdated. Many recommendinstlaling homebrew and newer versions of ruby to mitigate issues

### Resources:
- Installing on macOS: https://jekyllrb.com/docs/installation/macos/
- Installing newer ruby on macOS: https://www.moncefbelyamani.com/why-you-shouldn-t-use-the-system-ruby-to-install-gems-on-a-mac/
