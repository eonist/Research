### Formats supported:

json, yml, csv

people.yml
```yml
- name: "mike"
  occupation: "andorid dev"
- name: "ben"
  occupation: "mac dev"
- name: "melvin"
  occupation: "ios dev"
```

### in `_layouts/home.html`
```
{{ site.data.people }}
```

## Prints out:
```
{"name"=>"mike", "occupation"=>"android dev"}{"name"=>"ben", "occupation"=>"mac dev"}{"name"=>"melvin", "occupation"=>"ios dev"}
```


## Looping the data:

```
{% for person in site.data.people %} <!–– dealing with data ––>
	{{ person.name }}, {{ person.occupation }} <br>
{% endfor %}
```

## prints out:
```
mike, andorid dev
ben, mac dev
melvin, ios dev
```

## Nested data set:

```yml
- title: "Projects"
  subcategories:
    - title: "project-sub1"
      items:
        - title: "project-sub1-item1"
          href: "#"
        - title: "project-sub1-item2"
          href: "#"
    - title: "project-sub2"
      items:
        - title: "project-sub2-item1"
          href: "#"
        - title: "project-sub2-item2"
          href: "#"

- title: "Support"
  subcategories:
   - title: "support-sub1"
     items:
      - title: "support-sub1-item1"
        href: "#"
      - title: "support-sub1-item2"
        href: "#"
```

```html
{% for entry in site.data.entries %}
  <h2>{{ entry.title }}</h2>
  {% for subcategory in entry.subcategories %}
    <h3>{{ subcategory.title }}</h3>
    <ul>
    {% for item in subcategory.items %}
      <li><a href="{{ item.href }}">{{ item.title }}</a></li>
    {% endfor %}
    </ul>
  {% endfor %}
{% endfor %}
```

```
<h2>Projects</h3>

  <h3>project-sub1</h3>
  <ul>
    <li><a href="#">project-sub1-item1</a></li>
    <li><a href="#">project-sub1-item2</a></li>
  </ul>

  <h3>project-sub2</h3>
  <ul>
    <li><a href="#">project-sub2-item1</a></li>
    <li><a href="#">project-sub2-item2</a></li>
  </ul>

<h2>Support</h3>

  <h3>support-sub1</h3>
  <ul>
    <li><a href="#">support-sub1-item1</a></li>
    <li><a href="#">support-sub1-item2</a></li>
  </ul>
```
