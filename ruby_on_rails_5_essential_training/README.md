# Ruby on Rails 5 Essential Training

Check out the course on [LinkedIn Learning](https://www.linkedin.com/learning/ruby-on-rails-5-essential-training).

## Setting up my machine

I hit some problems with getting `mysql` installed on my MacBook Air M1.  Here are the resources that helped me get it working:

1. https://gorails.com/setup/osx/11-big-sur
1. https://stackoverflow.com/questions/45474191/an-error-occurred-while-installing-mysql2-0-4-8-and-bundler-cannot-continue

## Running `simple_cms`

```
# Start up your database server
/opt/homebrew/bin/mysql.server start

# Start up your webserver
rails server
```

## Snippets
1. Create a new controller:  `rails generate controller ExampleController view`
1. Generate migration:  `rails generate migration DoNothingYet`
