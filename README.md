# genesis\_rails

GenesisRails is a warehouse for templates and initial configurations for
brand new rails project with the minimum needed for a quick development
environment.

## Install

So to intall this project, first, you need to add the following to your Gemfile:

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
rails g genesis_rails:copy_templates
```

This will copy all the default templates into your rails project. It's important
to remember that this needs to be recopied everytime there is a update on them.

## Recommended configuration

Follows some recommended configuration for your application if you are using
genesis:

```
# add the following lines in your app/assets/stylesheets/application.css to
# ignore the scaffolds file and import the needed bootstrap
 *= stub scaffolds
 *= require bootstrap

# add the following lines in your app/assets/javascripts/applicationjs to import
# the needed bootstrap
//= require bootstrap
//= require magic_view

# add the following lines in your config/application.rb to configure the
# generators properly
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        model_specs: false,
        helper_specs: false
      g.fixture_replacement :factory_girl
      g.factory_girl dir: "spec/factories"
    end

# add the following lines in your spec/rails\_helper.rb to configure the
# database cleaner for your rspec tests
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
```

## TODO

- [ ] Make that generator become a rake task
- [ ] Create a template.rb file to use with `rails new -m template.rb`
- [ ] Make an install generator to install everything that's needed

