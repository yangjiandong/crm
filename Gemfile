source 'http://rubygems.org'

gem 'rails', '3.0.1'

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
    gem 'mysql2',               '>= 0.2.4'
end

gem 'acts_as_commentable',  '>= 3.0.0'
gem 'authlogic',            '>= 2.1.6', :path => File.join(File.dirname(__FILE__), 'vendor', 'gems', 'authlogic')
gem 'haml',                 '>= 3.0.21'

gem 'paperclip',            '>= 2.3.3'
gem 'simple_column_search', '>= 1.1.0'
gem 'will_paginate',        '>= 3.0.pre2'

group :development do
  gem 'annotate',           '>= 2.4.0'
  gem 'awesome_print',      '>= 0.2.1'
  gem 'ffaker',             '>= 0.4.0' # Fast Faker for `rake crm:demo:load`
end

group :test do
  gem 'test-unit', '1.2.3' if RUBY_VERSION.to_f >= 1.9
  gem 'factory_girl',       '>= 1.3.2'
  gem 'ffaker',             '>= 0.4.0'
  gem "rspec-rails",        '>= 2.0.1'
  gem "rspec",              '>= 2.0.1'
  gem "rspec-core",         '>= 2.0.1'
  gem "rspec-expectations", '>= 2.0.1'
  gem "rspec-mocks",        '>= 2.0.1'
end

# https://github.com/ludicast/yaml_db
gem 'yaml_db'

# Gem watch list:
#---------------------------------------------------------------------
# gem 'authlogic',         :git => 'git://github.com/crossroads/authlogic.git', :branch => 'rails3'
# gem 'gravatar-ultimate', :git => 'git://github.com/crossroads/gravatar.git'
# gem 'paperclip',         :git => 'http://github.com/thoughtbot/paperclip.git'

# Rails3 plugins that we use and their source repositories:
#---------------------------------------------------------------------
# gravatar_image_tag,      git://github.com/mdeering/gravatar_image_tag.git
# calendar_date_select,    git://github.com/timcharper/calendar_date_select.git
# country_select,          git://github.com/rails/country_select.git
# dynamic_form,            git://github.com/rails/dynamic_form.git
# is_paranoid,             git://github.com/theshortcut/is_paranoid.git
# prototype_legacy_helper, git://github.com/rails/prototype_legacy_helper.git
# responds_to_parent,      git://github.com/markcatley/responds_to_parent.git
