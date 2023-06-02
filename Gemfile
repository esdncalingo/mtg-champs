source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem 'pry-byebug'
# gem "jbuilder"
gem "redis", "~> 4.0"
# gem "kredis"
gem "bcrypt", "~> 3.1.7"
gem 'jwt', '~> 2.7'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem 'faker'
gem 'simplecov', require: false, group: :test
gem 'sprockets-rails', :require => 'sprockets/railtie'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'solargraph'
end
