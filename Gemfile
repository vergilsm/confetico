source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Гем для создания форм в views
gem 'simple_form'
# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'bootstrap', '~> 4.3.1'
gem 'font-awesome-rails'
gem 'rails-i18n'

gem "active_model_serializers", '~> 0.10.7'

# Для загрузки изображений
gem 'carrierwave'
# Для обработки изображений
gem 'rmagick'
# Для загрузки изображений на heroku
gem 'fog-aws', group: :production

# Для аутентификации админа
gem 'devise'
gem 'devise-i18n'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Гем для показа нарушений кодстайла
  gem 'rubocop', require: false
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  gem 'factory_bot_rails', "~> 4.0"
  gem 'rspec-rails', '~> 3.7'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
