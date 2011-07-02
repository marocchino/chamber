source 'http://rubygems.org'

# Bundle edge Rails instead:
gem 'rake', "~> 0.9.1"
gem 'rails', "~> 3.1.0.rc4"

#gem 'rails'
# for rails 3.1


gem 'sqlite3'

gem 'mongoid'
gem 'bson_ext'
gem 'decent_exposure'
gem 'simple_form'
gem 'haml'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test, :cucumber do
  gem 'haml-rails'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-pow'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'ruby-debug19', :require => 'ruby-debug'
end
group :test, :cucumber do
  gem 'capybara'
  #gem 'capybara-webkit'
  gem 'database_cleaner'
end
