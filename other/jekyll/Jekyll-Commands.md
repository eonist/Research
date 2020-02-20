## **Instaltion**

Update jekyll:
```
sudo gem update jekyll
```

Installing earlier Jekyll 2.5.3
```
gem install jekyll -v 2.5.3
```

Installing jekyll on OSX (If you have trouble with OSX Rootless issue or SIP)
```
sudo gem install -n /usr/local/bin/ jekyll
```

Uninstall jekyll
```
gem uninstall jekyll
```

Uninstall gem:
```
gem uninstall -aIx
```

You need to manually install jekyll-paginate:
```
sudo gem install jekyll-paginate
```

Fixing OSX Rootless
```
sudo nvram boot-args="rootless=0"
sudo reboot
```

List all gems:
```
gem list
```

## **Running**

New project: ⭐️
```
sudo jekyll new <project-name>
```

On-the-fly-updating (with out the local server feature, this is useful if you don't need to view it locally)
```
sudo jekyll build -w
```

On-the-fly-updating with local-server preview (press ctrl-c in terminal to stop)
```
sudo jekyll serve
```
Same as serve but sets the baseurl to zero so that the site works offline if it has a remote baseurl etc
```
sudo jekyll serve --baseurl ''
```

post you want to show up in draft mode go here: `_drafts/`
```
jekyle server -draft
```
