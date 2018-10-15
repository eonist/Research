###**You can now use Atom-script:** 
Which is a package that allows you to run scripts in all the common script languages directly from atom. Hello applescript! install under Settings - Packages, search for applescript  

To run a script with Atom-Script: **"cmd-i"**

Atom AppleScript snippet overview [here](https://github.com/eonist/GitSync/issues/34) 

###~~Execute .applescript from terminal:~~ 

```applescript
on run arg
	--do whatever you want with arg
	log arg's first item
	log arg's second item
end run
```
In terminal type:
```
osascript /path/to/your.applescript "testing" "abc"
```
terminal outputs: testing,abc

**~~In atom you can instal terminal-panel which gives you a small terminal at the bottom of atom.~~**


1. Hit ctrl + shift + c to copy the full path of the file you have in focus in Atom 
2. Open terminal-panel in Atom: shift+cmd+t
3. Use TextExpander to map the word "osa" to "osascript " and use enter as your trigger. Trigger this.
4. Paste the full path into the terminal-panel and hit enter.
5. Next time you want to debug you just just press up and enter to repeat the last terminal call

Now you are running the applescript from Atom, with call-backs and log etc. 
You can now debug applescript in Atom. 


- Using Atom as your terminal editor [here](https://github.com/eonist/GitSync/issues/41)


Map a key-shortcut to a custom function in Atom
```
//1. First hit cmd+shift+p to find the action you want to map to a key shortcuts (write the name down)
//2. then go to Atom.app->Atom -> keymap -> then add this text to the end of the document 
'atom-workspace':
   'cmd-shift-a': 'tree-view:reveal-active-file'
//3. write the name you wrote down with the above syntax, all lowerase and "-" as delimter
//4. save the Documents
//5. Now figure out how to overide exisitng keyshortcuts...
```


Disable auto brackets
```
https://discuss.atom.io/t/how-to-stop-atom-from-auto-closing-and-swallowing-braces-and-quotes/2566/16
```