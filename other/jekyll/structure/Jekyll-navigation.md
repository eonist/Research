### Highlighting where you are on the site in navigation
- It’s good practice to highlight the navigation on the website to help your users understand where they are in the structure of the site.

- Jekyll can do this with some if-statements inside our navigation’s <a> tags. The if-statements check what page is current then only add a class to the appropriate <a> tag.

- The if-statement is wrapped around the `class="…"` attribute, therefore the class will only shown on the <a> tag when the page is active. It can be styled in CSS just like normal.

```html
<a href="{{site.baseurl}}/plant-eaters/" {% if page.url == '/plant-eaters/' %} class="current" {% endif %}>Plant eaters</a>
```
