# Data files:
- Data files are a great way to **separate the content** from the it's presentation HTML.
- Data files are mostly written in **YAML**, but other languages can also be used.
- First create a new folder in your Jekyll website named: `_data`, put it in the same location as the index.html and the `_layouts` folder.

```YAML
_config.yml
_data/  ## ⬅︎ The data folder
_layouts/  ## ⬅︎ The place where index.html is located etc
index.html
```
Then inside that folder make your **data-file**, named with the `.yml` extension. Here’s an example data-file:

`dinos.yml`
```YAML
- name: Tyrannosaurus
  diet: Meat
  size: Big
- name: Stegosaurus
  diet: Plants
  size: Medium
- name: Velociraptor
  diet: Meat
  size: Small
```
- After we have the data file created we can use it in our website.
- The great thing about doing it this way is that we don’t have to copy and paste our HTML, Jekyll will do the work for us.

```
{% for dino in site.data.dinos %}
  <h2>{{dino.name}}</h2>
  <dl>
    <dt>Diet</dt>
    <dd>{{site.diet}}</dd>
    <dt>Size</dt>
    <dd>{{site.size}}</dd>
  </dl>
{% endfor %}
```
- Using a for loop we’re looping over every entry in the data file. The `site.data.dinos` is how we access our data file—the .dinos part is exactly the name of the file.
- Because there are three dinosaurs in the data file, Jekyll will automatically output the above HTML three times: once for each dinosaur.


### JSON:

```
So, the final file, authors.json:

{
   "andre": {
       "name": "Andre Santos",
       "site": "http://test.dev",
       "email": "andre@test.dev"
   },
   "john": {
       "name": "John Doe",
       "site": "",
       "email": "john.doe@test.dev"
   }
}
```

### Key val

```
For a data.yml like

key1: value1
key2: value2
...
How should I get a list of keys/values in a forloop? I tried

{%- for datum in site.data.data -%}
{{ datum }}
{%- endfor -%}
and I got key1value1key2value2.... How to separate them?

It is poorly documented, but datum is an array of key and value, so datum[0] is the key, and datum[1] is the value. This is only documented in Liquid’s old Github Wiki, but not in the official Liquid site. Old Wiki: https://github.com/Shopify/liquid/wiki/Liquid-for-Designers#allowed-collection-type…
```
