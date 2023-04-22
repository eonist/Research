# Posts
Jekyll supports posts, like blog posts, that can be used as an ordered type of content.
Posts must be named very strictly and stored inside the ✨`_posts`✨ folder:

```
_posts/
  2013-09-26-water-in-martian-dirt.md
  2013-10-06-clouds-on-kepler-7b-mapped.md
  2013-10-09-planet-without-star.md
```
- The post’s file name must begin with a properly formatted date, in the format: YYYY-MM-DD.
- To display a list of posts in your website, you can use Jekyll’s loop:

```html
<ul>
  {% for post in site.posts %}<!--  loop sites posts -->
    <li>
      <a href="{{site.baseurl}}{{post.url}}">{{post.title}}</a> <!-- extract url and title (always ref baseURL) -->
      <p>{{post.excerpt}}</p> <!-- extract content -->
    </li>
  {% endfor %}
</ul>
```

### Resources
[http://jekyllrb.com/docs/posts/](http://jekyllrb.com/docs/posts/)
