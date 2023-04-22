**.gitignore for xcode projects:**
http://stackoverflow.com/questions/49478/git-ignore-file-for-xcode-projects?rq=1

**Organizing source code:**
1. Start by dragging in a src folder from finder to xcode "file-treeview"
2. When prompted: Check "create groups"  
3. Any file you add will now be placed in the corresponding folder in finder
4. Create subfolders by right clicking treeview and selecting "New Group"
5. In the subsequent file prompt add a folder by the same name as your group.  
6. Use finder if you need to move folders and files around. Delete the root in xcode and drag in the src folder. The groups will now represent the reorganized file structure.  

**Remove the copyright text in new .swift files** (you may need to do it after every xcode update)
Remove all text here:

**folder** :  
"~/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Source/Swift\ File.xctemplate"
**file** :   
"File.xctemplate/___FILEBASENAME___.swift"

**Tips**
Editor - Fix all in scope. (fixes all errors in a class) 👌

### Rename xcode project
- Click on the Project name 2 times in the right-side-bar 👉 rename the project
- Click on the project name 1 time 👉 on target 👉 build-settings 👉 set info .plist path
- Sometimes you also need to update path to .entitlements. Search for it in the target

### How to add a local package with swift package manager
- Terminal: swift package init
- Drag to GitHub desktop to make a .git repo
- Xcode file -> add swift package -> Add this to the url field: file:/// + >drag and drop the package folder here<

### Reset xcode:

```
rm -frd ~/Library/Developer/Xcode/DerivedData/*
rm -frd ~/Library/Caches/com.apple.dt.Xcode/*
defaults delete com.apple.dt.Xcode
rm -rf $HOME/Library/Application\ Support/Developer/Shared/Xcode
rm -rf $HOME/Library/Saved\ Application\ State/com.apple.dt.Xcode.savedState
rm -rf $HOME/Library/Preferences/com.apple.dt.Xcode.*
rm -rf ~/Library/Application\ Support/Xcode
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache
```

all fail? reinstall xcode, use app cleaner to remove xcode first
