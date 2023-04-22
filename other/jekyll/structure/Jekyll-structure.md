# Structure
An overview of the jekyl structure
### Pages:

- When you add .md files to the root, The nav gets populated with the link to these sub sites (Auto updates)
- **markdown files** has the content and use html layouts defined in frontmater for instance index.md
- **Page** A page is located under _pages. And is a markdown file. these can be looped
- **layouts** has css and liquid expands etc
- **liquid expands** can access markdown content, or site content, or blog content or other elements
- **includes** are html components that you can define in the /include folder. For nav, buttons, etc. You can also inject variables into the include from the POV of the html file etc
- **Data** is a utility that can be used to format data structures. yaml is used as structure
- **collection** is another data type. a post is a form of collection (needs more description)
