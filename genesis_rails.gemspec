$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "genesis_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "genesis_rails"
  s.version     = GenesisRails::VERSION
  s.authors     = ["kelvinst"]
  s.email       = ["kelvin.stinghen@gmail.com"]
  s.homepage    = "https://github.com/kelvinst/genesis_rails"
  s.summary     = "A complete set of tools for building rails applications"
  s.description = "A complete set of tools for building rails applications"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
