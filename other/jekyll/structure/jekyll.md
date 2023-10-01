# Jekyll
- An overview of the Jekyll structure.
- You can also google jekyll questionsand there will be explanations etc
- Read the `jekyl-install.md` guide to get started with a basic setup

1. You use terminal to output html from jekyll config
2. Collection can be used as pages,  stored in `config.yml`
3. CSS is the same as a normal website
4. **Layouts** are wrappers that contain content in .md files stored in `_layouts`
5. **Includes** are mixin html snippits that we can use in our .md files stored in `_includes`
6. **Includes** can have placeholders we can change from .md content (highlighting a page in nav etc)
7. Use if page == `some page` to highlight navigation etc
8. Blog posts are stored in `_posts`

### Breaking it down:

- When you add .md files to the root, The nav gets populated with the link to these sub sites (Auto updates)
- **markdown files** has the content and use html layouts defined in front-mater for instance `index.md`
- **Page** A page is located under _pages. And is a markdown file. these can be looped. and is the site structure of your website
- **layouts** has css and "liquid-expands" etc
- **liquid expands** can access markdown content, or site content, or blog content or other elements
- **includes** are html components that you can define in the /include folder. For nav, buttons, etc. You can also inject variables into the include from the POV of the html file etc
- **Data** is a utility that can be used to format data structures. yaml is used as structure
- **collection** is another data type. a post is a form of collection (needs more description)
