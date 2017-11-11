# shoutlink

An API to create Heroku-like memorable random names for URLs

#### Shorten a URL

```
/api/create
```

*Parameters*: ```url``` (the original URL to be shortened) and ```password``` (optional)

*Response*: short memorable id (to be used while retrieving)

#### Get a URL

```
/api/view/:id
```

*Parameters*: password (if required)

*Response*: the original URL that was shortened

#### Open a URL

```
/api/open/:id
```

*Parameters*: password (if required)

*Response*: redirect to the original URL that was shortened

### Example

[http://shoutlink.herokuapp.com/api/create?url=http://google.com](http://shoutlink.herokuapp.com/api/create?url=http://google.com)

[http://shoutlink.herokuapp.com/api/open/blue-bird](http://shoutlink.herokuapp.com/api/open/blue-bird)

[http://shoutlink.herokuapp.com/api/create?url=http://github.com&password=test](http://shoutlink.herokuapp.com/api/create?url=http://github.com&password=test)

[http://shoutlink.herokuapp.com/api/view/dawn-cloud?password=test](http://shoutlink.herokuapp.com/api/view/dawn-cloud?password=test)

### Local Usage

Install PostgreSQL, and create a database using `CREATE DATABASE mydb;`

To start the server, run:

```
bundle install
bundle exec rackup
```

Replace the hostname in the examples with `localhost:9292` for local development.
