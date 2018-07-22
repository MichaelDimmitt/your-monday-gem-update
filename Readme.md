## Lets start with lessons learned
# Lesson 1, Generators touch your gemfile invasively

Installing a gem that has a lot of dependencies does not add more gems to the gemfile.
#### example 1:
```bash
bundle init
bundle add schema_plus
```
```ruby
# Gemfile
gem "schema_plus", "~>2.0"
```
#### example 2:
```bash
bundle add rails
```
```ruby
# Gemfile
gem "schema_plus", "~>2.0"
```

Some gems have generators that place new gems in your Gemfile.
#### example 1:
```bash
rails new
```

```ruby
# Gemfile
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```
