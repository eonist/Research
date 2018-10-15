- Fence down code in github: [fence](https://help.github.com/articles/github-flavored-markdown/#fenced-code-blocks)  

- Github markdown Todo syntax [here](https://help.github.com/articles/writing-on-github/#task-lists)  

- Retina friendly images In Github markdown pages:

```
//Add the image with this syntax set the width to half:
<img width="320" alt="Title" src="https://google.com/img.jpg">

//As apposed to the simpler form:
![img](https://google.com/img.jpg) 
```

Here is the github wiki syntax overview:  
[link](https://github.com/gollum/gollum/wiki) 

Vimeo video clickable retina image:
```
<a href="https://vimeo.com/144772908"><img width="270" alt="Vimeo video" src="https://i.vimeocdn.com/video/542693169_590x332.jpg"></a>
```

Create gif videos from .mp4 (drag and drop support)   
```
https://giphy.com (dark border)
http://image.online-convert.com/convert-to-gif (big size)
http://graphicdesign.stackexchange.com/questions/46656/how-to-convert-a-video-file-into-an-animated-gif-in-photoshop (photoshop)
```

For short urls you can use:
```
http://git.io/
```

<img width="320" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Screen Shot 2015-12-11 at 09.22.39.png">

**Semi-automated image uploading to github wiki pages etc:**
 1. copy the file name   
 2. Drag the file to a public dropbox.  
 3. Use TextExpander to create a static URL to the fileName you still have in your clipBoard.  

 
 ### Anchor
 To create an anchor to a heading in github flavored markdown. Add - characters between each word in the heading and wrap the value in parens (#some-markdown-heading) so your link should look like so:
”
 `[create an anchor](#anchors-in-markdown)`