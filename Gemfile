source 'https://rubygems.org'

ruby '2.3.1'

# bootstrap_form is a rails form builder that makes it super easy to create beautiful-looking forms using Twitter
# Bootstrap 3+
gem 'bootstrap_form', '~> 2.3'
# bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications.
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
# Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
# Need this in the production gems for now to support demostrating with data
# in production
gem 'faker', '~> 1.6', '>= 1.6.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc1', '< 5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # factory_girl_rails provides integration between factory_girl and rails 3 (currently just automatic factory
  # definition loading)
  gem 'factory_girl_rails', '~> 4.7'
  # BDD for Ruby
  # Need to add all these in explicity to workaround an issue with 3.4.0 being locked in rspec-rails
  gem 'rspec', '~> 3.5.0.beta3'
  gem 'rspec-core', '~> 3.5.0.beta3'
  gem 'rspec-expectations', '~> 3.5.0.beta3'
  gem 'rspec-mocks', '~> 3.5.0.beta3'
  gem 'rspec-support', '~> 3.5.0.beta3'
  # rspec-rails is a testing framework for Rails 3.x and 4.x.
  gem 'rspec-rails', '~> 3.5.0.beta3'

  # Rails 5 default gems follow...

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Guard is a command line tool to easily handle events on file system modifications.
  gem 'guard', '~> 2.14'
  # Guard::RSpec automatically run your specs (much like autotest).
  gem 'guard-rspec', '~> 4.7', '>= 4.7.2'
  # Guard::Rubocop automatically checks Ruby code style with RuboCop when files are modified.
  gem 'guard-rubocop', '~> 1.2'
  # Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop', '~> 0.40.0'

  # Rails 5 default gems follow...

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact
  # with a website
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  # Making tests easy on the fingers and eyes
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
