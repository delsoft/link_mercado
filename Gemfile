source 'https://rubygems.org'

gem 'bcrypt-ruby', '3.0.1', require: 'bcrypt'
gem 'jquery-rails'
gem 'mysql2', '0.3.11'
gem 'rails', '3.2.3'
gem 'unicorn', '4.3.1'
gem 'more_validators', '0.2.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', platform: :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', '2.10.1'  
  gem 'database_cleaner', '0.8.0'
  gem 'shoulda-matchers', '1.2.0'
  #gem 'annotate', '>= 2.4.0'
  gem 'wirble', '>= 0.1.3'
  gem 'hirb', '>= 0.7.0'
  gem 'awesome_print', '>=1.0.2'
  gem 'what_methods', '>= 1.0.1'
  
  gem 'factory_girl_rails', '3.3.0'

end

group :development do
  gem 'railroady'
#  gem 'ruby-debug-ide'
#  gem 'linecache19'
  #gem 'ruby-debug19', :require => 'ruby-debug'  
#   gem 'ruby-debug'  
end

group :test do
  # gem 'factory_girl_rails', '3.3.0'
  gem 'capybara', '1.1.2'
end

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
