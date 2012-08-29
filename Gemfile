source 'https://rubygems.org'

gem 'rails', '~>3.2.8'

gem 'mysql'

gem 'decent_exposure',      '~> 1.0.2'
gem "simple_form",          "2.0.1"
gem "devise",               "2.0.4"
gem "audited-activerecord", "~> 3.0.0.rc1"

#support coffeescript in rails unobtrusive js on the server
gem 'therubyracer', :platform => :ruby
gem 'coffee-rails', '~> 3.2.1'

gem 'jquery-rails'

group :assets do
  gem 'sass-rails',              '~> 3.2.3'

  gem 'uglifier',                '>= 1.0.3'
  gem 'blueprint-rails',         '~> 0.1.2'
  gem 'twitter-bootstrap-rails', '~> 2.1.1'
  gem 'jquery-ui-rails'
end


# Deploy with Capistrano
gem 'capistrano'

group :development, :test do
  gem "ecrails_templates", :git => "git@github.com:edgecase/ecrails_templates.git"
  gem "rspec-rails",       '~> 2.9.0'
  gem "jasminerice",       '~> 0.0.9'
  gem 'capybara',          '~> 1.1.2'
  gem 'poltergeist',       '~> 0.6.0'
  gem 'launchy',           '~> 2.1.0'
  gem 'database_cleaner',  '~> 0.8.0'
  gem 'thin',              '~> 1.3.1'
  gem 'machinist',         '~> 2.0.0'
  gem 'guard',             '~> 1.1.1'
  gem 'rb-fsevent',        '~> 0.9.1'
  gem 'guard-livereload',  '~> 1.0.0'
  gem 'guard-rspec',       '~> 1.2.1'
  gem 'guard-jasmine',     '~> 1.7.0'
  gem 'pry-rails',         '~> 0.1.6'
end
