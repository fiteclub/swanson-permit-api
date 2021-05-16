source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'carrierwave'
gem 'cloudinary'
gem 'factory_bot_rails'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
gem 'rspec-rails'
gem 'rswag'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # faker and factory_bot moved to production, because in this specific use case
  # we need to generate data in production
  # gem 'factory_bot_rails'
  # gem 'faker', git: "https://github.com/faker-ruby/faker.git", branch: 'master'
  gem 'rswag-specs'
end

group :development do
  gem 'amazing_print'
  gem 'jazz_fingers'
  gem 'listen', '~> 3.2'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
