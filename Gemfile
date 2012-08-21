source 'https://rubygems.org'

gem 'rails', '3.2.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'thin'
gem 'carrierwave'
gem "rmagick"
gem 'devise'
gem 'cancan'
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "koala"

gem "activerecord-postgresql-adapter"


group :development, :test do
    gem 'rspec-rails', '2.10.0'
    gem 'guard-rspec', '0.5.5'
    gem 'wirble'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails', '2.10.0'
  gem 'spork', '0.9.0'
  gem 'guard-spork', '0.3.2'
  gem 'factory_girl_rails'
end

group :production do
 gem 'hirb'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :mac_development do #en mac hacer bundle install --without linux_development
  gem 'rb-fsevent', :require => false
  gem 'growl', '1.0.3'
end

group :linux_development do #en ubuntu hacer bundle install --without mac_development
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
 gem 'debugger', group: [:development, :test]
