## Lets start with lessons learned

# Lesson 3, Still Work in progress please go to next [section](https://github.com/MichaelDimmitt/your-monday-gem-update/tree/project-plan-and-notes#lesson-2-you-can-format-gems-brought-in-through-generators).
## plan for project:
0) I need an experiments folder where I put some gems
<br/>gems need to be at older acceptable versions to allow updating or ignoring to test out bundle commands
<br/>keep each gemfile simple to test specific features

3 or 4 gems all upgradable should do the trick.

What are we going to be doing?
<pre>
1) Every monday update all the things. In the fastest conservative way possible.
2) Log the steps we took. 
3) Lets you step back if something breaks.
4) Lets you retrace your steps if you learn something breaks a week later.
5) Then you can do each step to find the gem that actually broke when upgraded.
</pre>

1)
```bash
bundle update ruby
bundle update rails
```
2)
```bash
cp Gemfile .temperaryGemfileBecauseBundleUpdateIsDestructive
bundle update --strict --patch --conservative
bundle update --strict --minor --conservative
bundle update --strict --major --conservative
# Cases:
# # Gemfile.lock
# foo (1.4.3)
#   bar (~> 2.0)
# bar (2.0.3)
#
#
# #  Command Line                     Result
# ------------------------------------------------------------
# 1  bundle update --patch            'foo 1.4.5', 'bar 2.1.1'
# 2  bundle update --patch foo        'foo 1.4.5', 'bar 2.1.1'
# 3  bundle update --minor            'foo 1.5.1', 'bar 3.0.0'
# 4  bundle update --minor --strict   'foo 1.5.0', 'bar 2.1.1'
# 5  bundle update --patch --strict   'foo 1.4.4', 'bar 2.0.4'

bundle update --conservative #update to the latest version; update dependencies only if necessary
bundle update --ultra-conservative #update to the maximum possible version still satisfied by current dependencies
```
3)
```bash
## update all excluding a gem
bundle update --without rails # this should work even though it isnt int the docs. But if it doesnt it will work with bundle install --without

## update a specific gem
bundle update rails
```

4)
```bash
# Gemfile analysis
https://bundler.io/v1.5/gemfile.html#gemfiles
https://guides.rubygems.org/patterns/#pessimistic-version-constraint
```

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
