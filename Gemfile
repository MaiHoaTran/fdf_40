source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "3.1.11"
gem "bootstrap-sass", "3.3.7"
gem "bootstrap-will_paginate"
gem "cancancan"
gem "carrierwave", "1.2.2"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "faker"
gem "font-awesome-rails"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-easing-rails"
gem "jquery-rails"
gem "mini_magick", "4.7.0"
gem "mysql2", ">= 0.3.18", "< 0.6.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "rails-controller-testing"
gem "ransack"
gem "rubocop", require: false
gem "sass-rails", "~> 5.0"
gem "sidekiq"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate"
# gem 'font-awesome-sass', '~> 5.0.9'
group :development, :test do
  gem "selenium-webdriver"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
