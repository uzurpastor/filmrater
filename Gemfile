source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false
gem 'faker'

gem 'kaminari'
gem 'bootstrap'
gem 'jquery-rails'

# Autorization
gem 'devise'
gem 'cancancan'



group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3'
end

group :test do 
  gem 'factory_bot_rails'  
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'
end

