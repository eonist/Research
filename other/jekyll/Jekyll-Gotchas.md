Jekyll makes use of port 4000 on localhost by default. To view your project locally, open your web browser and navigate to the following address:

```
http://localhost:4000 (http://127.0.0.1:4000/ should also work)
```

View Your Jekyll Site Throughout Your Local Network
You can access your Jekyll site locally at http://localhost:4000, but when you enter that address into your phone, tablet, or other device on your local network, you cannot access the site for testing, designing, and development purposes! How can you circumvent this hurdle? Well, with the use of this special flag to view your Jekyll site on any device on your local network:

```
jekyll serve --host=0.0.0.0
```
Example:
```
http://192.168.1.156:4000
```

- If you set a blog post to a date that hasn't happened yet it wont show up until that date. (Nice way to que posts)