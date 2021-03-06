source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',        '~> 5.1.5'
gem 'puma',         '~> 3.7'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
gem 'bootstrap',    '~> 4.0.0'
gem 'jquery-rails'
gem 'devise'
gem 'figaro'
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.1'
gem "font-awesome-rails"
gem 'has_friendship'
gem 'gravtastic'
gem 'omniauth-facebook'
gem 'will_paginate-bootstrap4'
gem 'acts_as_votable', '~> 0.11.1'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'letter_opener'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard', '>= 2.2.2'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'rb-fsevent'
end

group :production do
  gem 'pg', '~> 0.18.4'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
