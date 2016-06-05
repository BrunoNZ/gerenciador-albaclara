source 'https://rubygems.org'
ruby '2.3.0'
gem 'rails'

# DATABASE:
group :production do
  gem 'pg'
end
gem 'sqlite3'

# SERVER:
group :production do
  gem 'passenger'
end
gem 'thin'

# DEFAULT:
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass'
gem 'high_voltage'
gem 'therubyracer', :platform=>:ruby

group :development, :test do
  gem 'byebug'
  gem 'faker'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'mailcatcher'
end

# APP GEMS:
gem 'devise'
gem 'simple_form'
gem 'sidekiq'
gem 'sinatra', :require => nil
gem 'whenever'
gem 'cocoon'
gem 'premailer'
gem 'paperclip'
gem 'mime-types'
gem 'cancancan'
