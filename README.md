# Backent

A Backend for Events.

## Running Locally
Install the [Heroku Toolbelt](https://toolbelt.heroku.com/) and [Postgres](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup).

```sh

$ mkvirtualenv -p /usr/bin/python3 backent
$ pip install -U pip setuptools
$ pip install -r requirements.txt

$ createdb backent

$ python manage.py migrate
$ python manage.py collectstatic

$ heroku local
```

Your app should now be running on [localhost:5000](http://localhost:5000/).


## Deploying

Use the cedar-14 stack as the current one is not yet suitable for GEOS.
https://blog.trailblazingtech.com/running-geodjango-on-heroku-august-2017-aee97fbb7f7c

```sh
$ heroku create

$ make deploy

$ heroku open
```

##  Troubleshooting

```sh
$ heroku config:set VAR=xxx VAR2=yyy
$ heroku pg:reset DATABASE_URL
```


## Documentation

For more information about using Python on Heroku, see these Dev Center articles:

- [Python on Heroku](https://devcenter.heroku.com/categories/python)
