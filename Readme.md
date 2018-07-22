## Lets start with lessons learned

# Lesson 2, You can format Gems brought in through Generators

#### Notice, the two space indent in the gemfile here will allow code folding between the comment.
```ruby
# Gemfile
gem 'rails', '~> 5.2.0'
## common dependencies originally generated from `rails new` command
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
## end common dependencies generated from `rails new` command
```
#### Why is this important? For maintainability you may be very interested in the specific packages that you installed and understand what was brought in with boiler plate. To help better manage when new packages require the simular dependency. Better understand how new gems interact with gems brought in by the boiler plate to make an informed decision on how to proceed. 

#### Begging the question, do you update the boiler plate to update the dependencies or do you update or downgrade the specific gem you just brought in to comply?

### Result:
![image](https://user-images.githubusercontent.com/11463275/43051186-b883a6c6-8de3-11e8-8b4d-03f55ec4aef5.png)

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
