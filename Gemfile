source 'http://rubygems.org'

gem 'rails', '2.3.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3-ruby', :require => 'sqlite3'

if defined?(JRUBY_VERSION)
    # gem 'jdbc-sqlite3'
    gem 'activerecord-jdbc-adapter'
    gem 'activerecord-jdbcsqlite3-adapter'
    gem 'activerecord-jdbcmysql-adapter'
    gem 'jruby-openssl'
    gem 'jruby-rack'
    gem 'warbler'
else
    gem 'sqlite3-ruby', :require => 'sqlite3'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

gem 'yaml_db'
gem 'uuidtools'
