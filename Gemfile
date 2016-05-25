source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
gem 'mysql2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'jpbuilder'
gem 'sdoc', '~> 0.4.0', group: :doc
# gem 'bcrypt', '~> 3.1.7'

# young added
gem 'devise'
gem 'unicorn'

# json response
gem 'rabl', '~> 0.12.0'
gem 'oj'
gem 'rb-readline'
# facebook
gem 'koala'
# image
gem 'paperclip'
# aws
gem 'aws-sdk', '~> 1.6'
# gem 'aws-sdk', '~> 2'
gem 'aws-sdk-rails'

# scheduler
gem 'whenever'
gem 'nokogiri'

# active admin
gem 'activeadmin', github: 'activeadmin'
gem 'draper'

gem 'rpush'
gem 'rdiscount'

group :development, :test do
	gem 'byebug'
	gem 'web-console', '~> 2.0'
	gem 'spring'
	gem 'flog'
	gem 'flay'
	gem 'faker'
	gem 'ci_reporter'
	gem 'ci_reporter_rspec'

	# cap
	gem 'capistrano', '~> 3.1'
	gem 'capistrano-rails'
	gem 'capistrano-rbenv'
	gem 'capistrano-bundler'
	gem 'capistrano3-unicorn'

	# chef
	gem 'chef'
	gem 'knife-solo'
	gem 'librarian-chef'
	gem 'test-kitchen'
	gem 'kitchen-vagrant'
end

group :test do
	#gem 'test_after_commit'
	gem 'fakeredis' # for mocking redis in local/test env
	gem 'timecop'
	gem 'capybara'
	gem 'guard-rspec'
	# for rspec test
	gem 'rspec-rails', '~> 3.0' #'~>2.14.2'
	gem 'factory_girl_rails'
	gem 'shoulda-matchers'
	gem 'forgery'
	gem 'better_errors'
	gem 'binding_of_caller'
end
