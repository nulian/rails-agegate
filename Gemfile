source "http://rubygems.org"

# Declare your gem's dependencies in agegate.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

gem 'rspec-rails', group: [:test, :development]
gem 'factory_girl_rails', group: [:test, :development]
gem 'jazz_hands', group: [:test, :development]

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'guard-livereload'
  gem 'pry-rails'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

# To use debugger
# gem 'debugger'
