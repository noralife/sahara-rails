Sahara Rails
============

Sample Rails Application

# Usage

```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s # for dev
```

# Docker Compose

```
$ docker-compose build
$ docker-compose run rails rake db:create
$ docker-compose run rails rake db:migrate
$ docker-compose run rails rake db:seed
$ docker-compose up
```
