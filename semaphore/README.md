## Rails Testing Handbook

> Build sustainable web apps with behavior-driven development

> The [rails testing handbook](https://semaphoreci.com/ebooks/rails-testing-handbook) shares Semaphore CI's experience in getting Semaphore to web scale without ever losing control of the codebase. The best part? These techniques will work both in new projects and large Ruby on Rails applications.

## Prerequisites

1. Unix-based development environment
1. Git
1. Ruby 2.4.0
1. Node.js
1. PostgresSQL 9.5

## Project setup

Install Rails

```
gem install rails
```

Generate a new Rails application

```
rails new bdd-app -d postgressql
```

Install dependencies

```
bundle install --path vendor/bundle
```

