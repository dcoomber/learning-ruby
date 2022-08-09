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
1. Working with migrations:
   ```ruby
   rails db:migrate
   rails db:migrate VERSION=0
   rails db:migrate:status
   rails db:migrate VERSION=20211211125002
   rails db:migrate:up VERSION=20211211125002
   rails db:migrate:down VERSION=20211211125002
   rails db:migrate:redo VERSION=20211211125002
   ```
1. Generate a model:  `rails generate model SingularName`
1. Loads IRB (Interactive Ruby) but with Rails:
   ```ruby
   rails console
   rails c
   ```
1. Open the rails console in development environment:  `rails console development`
1. View a list of all the configured routes:  `rails routes`
1. Clear the web logs:  `rails log:clear to clear the log`

## My course notes

[Course notes](./CourseNotes_Ruby_on_Rails_5_Essential_Training.txt)
