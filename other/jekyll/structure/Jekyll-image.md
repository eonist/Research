### Linking images
- Linking to images isn’t really that different from regular linking
- But the addition of `{{site.baseurl}}` makes them work more reliably across hosts. (should work local and on server etc)

```html
<img src="{{site.baseurl}}/images/trex.jpg" alt="">
```
