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
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Haml templating
gem 'haml-rails'

# Devise for authentication
gem 'devise', '~> 3.2.4'

# Simple Forms
gem 'simple_form'

# Rest Client
gem "rest-client"

gem "zurb-foundation"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'railroady'
  gem 'binding_of_caller', platforms: :ruby
end

group :development,:test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'thin', platforms: :ruby

  gem 'spring-commands-rspec'

  gem 'guard-spring'
  gem 'guard-rspec'

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
  gem 'shoulda-matchers'
  gem 'spork'

  gem 'rb-inotify', require: false
  gem 'faker'
  gem 'database_cleaner'

  # Spefic version here due to bug in 0.8.x.
  gem 'simplecov', '~> 0.8.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
