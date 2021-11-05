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

### Install Rails

```
gem install rails
```

### Generate a new Rails application

```
rails new bdd-app -d postgressql
```

### Install dependencies

```
cd bdd-app
bundle config set path 'vendor/bundle'
```

### Setup the database

```
bundle exec rails db:create
bundle exec rails db:migrate
```

### Setup RSpec for writing unit specs

Add the `rspec` in the Gemfile under the developer and test group

```
group :development, :test do
    ...
    gem 'rspec-rails', '~> 3.5'
end
```

Then run `bundle install`

To finish the install, invoke the Rails generator

```
bundle exec rails generate rspec:install
```

### Install Cucumber

Add `cucumber-rails` gems to `:development` and `:test` groups of the Gemfile:

```
group :development, :test do
    ...
    gem 'cucumber-rails', require: false
end
```

Then run `bundle install`

To finish the install, invoke the Rails generator

```
bundle exec rails generate cucumber:install
```

### Install Shoulda-matchers

Add `shoulda-rails` gems to `:development` and `:test` groups of the Gemfile:

```
group :development, :test do
    ...
    gem 'shoulda-matchers', '~> 5.0'
end
```

Then run `bundle install`

To configure the gem to use the specified test framework and library, open `spec/rails_helper.rb` and add the following block at the end:

```
Shoulda::Matchers.configure do |config|

    config.integrade do |with|
        with.test_framework :rspec

        with.library :active_record
        with.library :active_model
        with.library :action_controller
        with.library :rails
    end

end
```

### Installing FactoryBot

Add the following to `:development` and `:test` groups of the Gemfile:

```
group :development, :test do
    ...
    gem 'factory_bot_rails'
end
```

Then run `bundle install`

#### Installing database cleaner

Add the following entry to the `:test' group:

```
group :test do
    ...
    gem 'database_cleaner'
end
```

Then run `bundle install`

To configure the gem to use the specified test framework and library, open `spec/rails_helper.rb` and add the following block at the end:

```
RSpec.configure do |config|

    config.before(:suite) do
        DatabaseCleaner.strategy = :transaction
        DatabaseCleaner.clean_with(:truncation)
    end

    config.around(:each) do |example|
        DatabaseCleaner.cleaning do
            example.run
        end
    end

end
```

#### Setting up the Rails Controller Testing gem

Add the following in the `:test` group of the Gemfile:

```
gem 'rails-controller-testing'
```

Then run `bundle install`

#### Setting up your Git repository

```
echo 'vendor/bundle' >> .gitignore
```

### Other items

#### Devise

Add the following to your Gemfile

```
gem 'devise'
```

Run `bundle install` to install the gem.

Generate the devise views with `bundle exec rails generate devise:install`

Add the following snippet to the `config/environments/development.rb` and `config/environments/test.rb` files:

```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Add the following to `config/routes.rb`:

```
root to: “home#index”
```

Add alerts and notifications to the application layout `app/views/layouts/application.html.erb`. This will be used by Devise to display errors in the user authorization flow.

```
<p class=”notice”><%= notice %></p>
<p class=”alert”><%= alert %></p>
```

Finally, create a user model, and run the migrations:

```
bundle exec rails generate devise User
bundle exec rails db:migrate
```

### Bootstrapping the homepage

Add the following controller (`app/controllers/home_controller.rb`):

```
class HomeController < ApplicationController
    def index
    end
end
```

#### Create a view for the controller action

##### RSpec unit test for a home controller

Create the following file:  `spec/controllers/home_controller_spec.rb`

```
require “rails_helper”

RSpec.describe HomeController do
    let(:user) { instance_double(User) }

        before { log_in(user) }

        describe “GET #index” do
            it “returns status ok” do
            get :index

            expect(response.status).to be(200)
        end
    end

end
```


