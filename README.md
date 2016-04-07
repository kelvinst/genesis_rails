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

The other gems are not hard dependencies, but we have some templates defined
that need them to work correctly, please check their installation guides
individually.

Then:

```bash
bundle install
```

And finally:

```bash
rails g genesis_rails:copy_templates
```

This will copy all the default templates into your rails project. It's important
to remember that this needs to be recopied everytime there is a update on them.

## TODO

- [ ] Make that generator become a rake task
- [ ] Create a template.rb file to use with `rails new -m template.rb`
- [ ] Make an install generator to install everything that's needed

