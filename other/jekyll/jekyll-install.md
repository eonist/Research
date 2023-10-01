### Terminal (installing jekyl software)
1. `ruby -v` (check if you have ruby installed)
2. `gem -v` (check if you have gem installed)
3. `sudo install jekyll bundler` (installs Jekyll) (type your admin password) seems we use: `sudo gem install bundler jekyll` now days. seems like we have to have xcode `xcode-select --install`
4. `jekyll new test_website` (makes jekyll website in user dir)
5. `cd  /Users/eon/test_website` (move to directory)
6. `bundle exec jekyll serve` (serves up the website at: http://127.0.0.1:4000/) (see jekyll-commands.md for more custom serve calls)

### Gotchas
- System ruby is outdated. Many recommendinstlaling homebrew and newer versions of ruby to mitigate issues

### Resources:
- Installing on macOS: https://jekyllrb.com/docs/installation/macos/
- Installing newer ruby on macOS: https://www.moncefbelyamani.com/why-you-shouldn-t-use-the-system-ruby-to-install-gems-on-a-mac/
