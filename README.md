# genesis\_rails

GenesisRails is a warehouse for templates and initial configurations for
brand new rails project with the minimum needed for a quick development
environment.

## Use

As this project is meant to be a set of basic generators and overrided templates
that depends on third party projects. These are the gems you will need for it:

- genesis\_rails (itself)
- rspec-rails
- factory\_girls\_rails
- responders
- simple\_form

Soon we will have a template for `rails new -m template.rb`, but for now, just
make sure you have all these gems on your Gemfile. Here is an example that
should work:

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

If you have any doubt or problem, don't be ashamed and open an issue.

