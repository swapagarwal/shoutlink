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

### Local Usage

Install PostgreSQL, and create a database using `CREATE DATABASE mydb;`

To start the server, run:

```
bundle install
bundle exec rackup
```

### Example

```
http://localhost:9292/api/create?url=http://google.com
http://localhost:9292/api/open/blue-bird
http://localhost:9292/api/create?url=http://github.com&password=test
http://localhost:9292/api/view/dawn-cloud?password=test
```
