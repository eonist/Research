## **Instaltion**

Update Jekyll:
```
sudo gem update jekyll
```

Update gem:
```
sudo gem update
```

Installing earlier Jekyll 2.5.3 (use sudo if you get permission error)
```
gem install jekyll -v 2.5.3
```

Installing Jekyll on OSX (If you have trouble with OSX Rootless issue or SIP)
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

You need to manually install jekyll-paginate if you want to use that:
```
sudo gem install jekyll-paginate
sudo gem install jekyll-paginate-v2
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

On-the-fly-updating with  ✨ local-server ✨ preview (press ctrl-c in terminal to stop) (config change requires reset)
```
sudo jekyll serve
```
Same as serve but sets the **base-url** to zero so that the site works offline if it has a remote baseurl etc
(**you must restart** if you make changes to config.yml) (✨use this one if you have url in config, as it then can be debugged locally etc✨)
the url will be: http://127.0.0.1:4000/ open that in safari etc
```
sudo jekyll serve --baseurl ''
```

post you want to show up in draft mode go here: `_drafts/`
```
jekyle server -draft
```

⚠️️ Remember to **restart** Jekyll after changes to config.yml, or else they wont take effect ⚠️️
