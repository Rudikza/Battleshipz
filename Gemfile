source 'http://gems.cloudafrica.net'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', "~> 2.1.0"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Haml templating
gem 'haml-rails', '~> 0.4'

# Devise for authentication
gem 'devise', '~> 3.2.1'

# Simple Forms
gem 'simple_form', '~> 3.0.0.rc'

# Rest Client
gem "rest-client", "~> 1.6.7"

gem "zurb-foundation", "~> 4.3.2"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors', '~> 0.7.2'
  gem 'binding_of_caller', platforms: :ruby
end

group :development,:test do
  gem 'thin', '~> 1.5.1', platforms: :ruby
  gem 'rspec-rails', '~> 2.14.0'
  gem 'factory_girl_rails', '~> 4.3.0'

  gem 'guard-spork', '~> 1.5.1'
  gem 'guard-rspec', '~>4.0.4'

  gem 'pry-rails'
  gem 'pry-doc'
  # Fix for Guard "Cant modify String error"
  gem 'rb-readline', '~> 0.5.0', require: 'readline'

  gem 'awesome_print'
  gem 'quiet_assets'

  gem 'fuubar'
  gem 'meta_request'
end

group :test do
  gem 'shoulda-matchers', '~> 2.4.0'
  gem 'spork', '~> 1.0.0rc4'

  gem 'rb-inotify', require: false
  gem 'simplecov', '~> 0.8.1', require: false
  gem 'faker', ' ~> 1.2.0'
  gem 'database_cleaner', ' ~> 1.2.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
