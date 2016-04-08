# genesis\_rails

GenesisRails is a warehouse for templates and initial configurations for
brand new rails project with the minimum needed for a quick development
environment.

## Pre requisites

So, there is no explicit pre requisite to install this gem and use it in your
rails project. But I actually recommend to be running with `rails ~> 4.2`,
`ruby ~> 2.2`, `postgres` (any version) aaaaaaand, if you are creating your
project now, to create it with the following command:

```bash
rails new my_project -T -d postgresql
```

That's it!

## Install

To intall this project, first, you need to add the following to your Gemfile:

```ruby
gem 'genesis_rails'
gem 'responders'
gem 'simple_form'

group :test do
  gem "rspec"
  gem "rspec-rails"
  gem "capybara"
  gem "database_cleaner"
  gem 'factory_girl_rails'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end
```

Then:

```bash
bundle install
```

The other gems are not hard dependencies, but we have some templates defined
that need them to work correctly, please check their installation guides
individually. If you are not so interested in reading everyone, here comes a
list of commands you'll probably need to execute:

```bash
rails g responders:install
rails g simple_form:install --bootstrap
rails g rspec:install
```

And finally:

```bash
rails g genesis_rails:install
```

This will copy all the default templates into your rails project, and may have
conflicts with other gems. If so, just diff them and choose which one you
prefer.

It's important to remember that this needs to be recopied everytime there is a
update on them.

## How to update

Well, that's a long story. Depends of course on how many things are you updating
at once, but I would recommend update all of them separetedly. So:

```bash
bundle update genesis_rails
```

After that, you'll be able to just:


```bash
rails g genesis_rails:install
```

This, of course, can have changes dependeding on which is the update and take
attention to your changes to the templates you've copied. Choose wisely if you
want or not the new version. :stuck_out_and_tongue:

## Recommended configuration

Follows some recommended configuration for your application if you are using
genesis:

```
<app/assets/stylesheets/application.css>
# add the following lines to ignore the scaffolds file and import the needed
# bootstrap
 *= stub scaffolds
 *= require bootstrap

<app/assets/javascripts/applicationjs>
# add the following lines to import the needed bootstrap
//= require bootstrap
//= require magic_view

<config/application.rb>
# add the following lines to configure the generators properly
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        model_specs: false,
        helper_specs: false
      g.fixture_replacement :factory_girl
      g.factory_girl dir: "spec/factories"
    end

<spec/rails_helper.rb>
# uncomment the following line to require the needed support files (one of them
# is copied on the genesis_rails installations)
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# then change the value of the following config to false (the raise of the code below
# is granting this will be always that way and explaining why it's needed, but
# I'm warning you one more tim: DO THIS AND DON'T REMOVE THAT RAISE!!!!!!)
  config.use_transactional_fixtures = false

# and finally add the following lines to configure the database cleaner for your
# rspec tests (put them inside the
  config.before(:suite) do
    # don't remove this raise for the sake of God!!!
    if config.use_transactional_fixtures?
      raise(<<-MSG)
        Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
        (or set it to false) to prevent uncommitted transactions being used in
        JavaScript-dependent specs.

        During testing, the app-under-test that the browser driver connects to
        uses a different database connection to the database connection used by
        the spec. The app's database connection would not be able to access
        uncommitted transaction data setup over the spec's database connection.
      MSG
    end
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    # :rack_test driver's Rack app under test shares database connection
    # with the specs, so continue to use transaction strategy for speed.
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

    unless driver_shares_db_connection_with_specs
      # Driver is probably for an external browser with an app
      # under test that does *not* share a database connection with the
      # specs, so use truncation strategy.
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
```

## TODO

- [ ] Make that generator become a rake task
- [ ] Create a template.rb file to use with `rails new -m template.rb`
- [ ] Make an install generator to install everything that's needed

