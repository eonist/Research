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
{"name"=>"mike", "occupation"=>"andorid dev"}{"name"=>"ben", "occupation"=>"mac dev"}{"name"=>"melvin", "occupation"=>"ios dev"}
```


## Looping the data:

```
{% for person in site.data.people %} <!––dealing with data––>
	{{ person.name }}, {{ person.occupation }} <br>
{% endfor %}
```

## prints out:
```
mike, andorid dev
ben, mac dev
melvin, ios dev
```
