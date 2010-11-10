# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
# NOTE: Fat Free CRM has been tested and works with Rails 2.3.2 and 2.3.3.
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
# Load Rails Engines
# require File.join(File.dirname(__FILE__), '../vendor/plugins/engines/boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  config.gem 'will_paginate', :version => '2.3.14'
  config.gem 'faker', :version => '0.3.1'

  #config.gem "inherited_resources", :version => "1.0.2"
  #config.gem "responders", :version => "0.6.2"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  config.active_record.observers = :activity_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'#'Beijing'#UTC
  # config.active_record.default_timezone = 'Beijing'#:local

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = 'en-US'

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  config.active_record.schema_format = :sql

  # Have migrations with numeric prefix instead of UTC timestamp.
  config.active_record.timestamped_migrations = false

  # ActionMailer configuration.
  config.action_mailer.default_content_type = "text/plain"
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.sendmail_settings = { :location  => "/usr/sbin/sendmail", :arguments => "-i -t" }
end

#
#class ActiveRecord::Migration
#
#  def self.alter_to_big_primary_key(tablename)
#    dialect = ActiveRecord::Base.configurations[ ENV['RAILS_ENV'] ]["dialect"]
#    case dialect
#    when "postgre"
#      execute "ALTER TABLE #{tablename} ALTER COLUMN id TYPE bigint"
#    when "mysql"
#      execute "ALTER TABLE #{tablename} CHANGE id id BIGINT AUTO_INCREMENT";
#    when "derby"
#      # do nothing as alter can not do the job in Derby
#    when "oracle"
#      # do nothing, oracle integer are big enough
#    when "sqlserver"
#        constraint=select_one "select name from sysobjects where parent_obj = (select id from sysobjects where name = '#{tablename}')"
#        execute "ALTER TABLE #{tablename} DROP CONSTRAINT #{constraint["name"]}"
#        execute "ALTER TABLE #{tablename} ALTER COLUMN id bigint"
#        execute "ALTER TABLE #{tablename} ADD PRIMARY KEY(id)"
#    end
#  end
#
#  def self.alter_to_big_integer(tablename, columnname, indexname=nil)
#    dialect = ActiveRecord::Base.configurations[ ENV['RAILS_ENV'] ]["dialect"]
#    case dialect
#     when "sqlserver"
#        execute "DROP INDEX #{indexname} on #{tablename}" if indexname
#        change_column(tablename, columnname, :big_integer, :null => true)
#        execute "CREATE INDEX #{indexname} on #{tablename}(#{columnname})" if indexname
#     else
#       change_column(tablename, columnname, :big_integer, :null => true)
#     end
#  end
#end
#
#module JdbcSpec
#
#  #
#  # Ticket http://tools.assembla.com/sonar/ticket/200
#  # Problem with mysql TEXT columns. ActiveRecord :text type is mapped to TEXT type (65535 characters).
#  # But we would like the bigger MEDIUMTEXT for the snapshot_sources table (16777215  characters).
#  # This hack works only for ActiveRecord-JDBC (Jruby use).
#  # See http://www.headius.com/jrubywiki/index.php/Adding_Datatypes_to_ActiveRecord-JDBC
#  # The following has been copied from WEB-INF\gems\gems\activerecord-jdbc-adapter-0.9\lib\jdbc_adapter\jdbc_mysql.rb
#  # Problem still in activerecord-jdbc-adapter 0.9
#  module MySQL
#    def modify_types(tp)
#      tp[:primary_key] = "int(11) DEFAULT NULL auto_increment PRIMARY KEY"
#      tp[:decimal] = { :name => "decimal" }
#      tp[:timestamp] = { :name => "datetime" }
#      tp[:datetime][:limit] = nil
#
#      # sonar
#      tp[:text] = { :name => "mediumtext" }
#      tp[:binary] = { :name => "longblob" }
#      tp[:big_integer] = { :name => "bigint"}
#
#      tp
#    end
#  end
#
#  # wrong column types on oracle 10g timestamp and datetimes
#  # Problem still in activerecord-jdbc-adapter 0.8
#  module Oracle
#    def modify_types(tp)
#      tp[:primary_key] = "NUMBER(38) NOT NULL PRIMARY KEY"
#      tp[:integer] = { :name => "NUMBER", :limit => 38 }
#      tp[:datetime] = { :name => "TIMESTAMP" }  # updated for sonar
#      tp[:timestamp] = { :name => "TIMESTAMP" } # updated for sonar
#      tp[:time] = { :name => "DATE" }
#      tp[:date] = { :name => "DATE" }
#
#      #sonar
#      tp[:big_integer] = { :name => "NUMBER", :limit => 38 }
#
#      tp
#    end
#
#  end
#
#  module MsSQL
#    def modify_types(tp)
#      tp[:primary_key] = "int NOT NULL IDENTITY(1, 1) PRIMARY KEY"
#      tp[:integer][:limit] = nil
#      tp[:boolean] = {:name => "bit"}
#      tp[:binary] = { :name => "image"}
#
#      # sonar patch:
#      tp[:text] = { :name => "NVARCHAR(MAX)" }
#      tp[:big_integer] = { :name => "bigint"}
#    end
#
#  end
#
#  # activerecord-jdbc-adapter has a missing quote_table_name method
#  module Derby
#    def modify_types(tp)
#      tp[:primary_key] = "int generated by default as identity NOT NULL PRIMARY KEY"
#      tp[:integer][:limit] = nil
#      tp[:string][:limit] = 256
#      tp[:boolean] = {:name => "smallint"}
#
#      #sonar
#      tp[:big_integer] = {:name => "bigint"}
#
#      tp
#    end
#
#    def quote_table_name(name) #:nodoc:
#      quote_column_name(name).gsub('.', '`.`')
#    end
#  end
#
#  module PostgreSQL
#    def modify_types(tp)
#      tp[:primary_key] = "serial primary key"
#      tp[:integer][:limit] = nil
#      tp[:boolean][:limit] = nil
#
#      # sonar
#      # tp[:string][:limit] = 255
#      tp[:big_integer] = { :name => "int8", :limit => nil }
#
#      tp
#    end
#
#    # See SONAR-862 on Postgre search_path setting.
#    # The issue is fixed in next activerecord-jdbc-adapter version: http://github.com/nicksieger/activerecord-jdbc-adapter/commit/2575700d3aee2eb395cac3e7933bb4d129fa2f03
#    # More details on https://rails.lighthouseapp.com/projects/8994/tickets/918-postgresql-tables-not-generating-correct-schema-list
#    def columns(table_name, name=nil)
#      # schema_name must be nil instead of "public"
#      schema_name = nil
#      if table_name =~ /\./
#        parts = table_name.split(/\./)
#        table_name = parts.pop
#        schema_name = parts.join(".")
#      end
#      @connection.columns_internal(table_name, name, schema_name)
#    end
#  end
#end
#
#module ActionView
#  module Helpers
#    module NumberHelper
#
#      def number_with_precision(number, *args)
#        options = args.extract_options!
#        options.symbolize_keys!
#
#        defaults           = I18n.translate('number.format', :locale => options[:locale], :raise => true) rescue {}
#
#        # SONAR : do not merge with 'number.precision.format'. It usually removes definitions of delimiter and separator.
#        # It looks to be fixed in Rails 2.3.
#        #precision_defaults = I18n.translate('number.precision.format''number.precision.format', :locale => options[:locale],
#        #defaults           = defaults.merge(precision_defaults)
#
#        unless args.empty?
#          ActiveSupport::Deprecation.warn('number_with_precision takes an option hash ' +
#            'instead of a separate precision argument.', caller)
#          precision = args[0] || defaults[:precision]
#        end
#
#        precision ||= (options[:precision] || defaults[:precision])
#        separator ||= (options[:separator] || defaults[:separator])
#        delimiter ||= (options[:delimiter] || defaults[:delimiter])
#
#        begin
#          rounded_number = (Float(number) * (10 ** precision)).round.to_f / 10 ** precision
#          number_with_delimiter("%01.#{precision}f" % rounded_number,
#            :separator => separator,
#            :delimiter => delimiter)
#        rescue
#          number
#        end
#      end
#    end
#  end
#end
#
## patch for SONAR-1182. GWT does not support ISO8601 dates that end with 'Z'
## http://google-web-toolkit.googlecode.com/svn/javadoc/1.6/com/google/gwt/i18n/client/DateTimeFormat.html
#module ActiveSupport
#  class TimeWithZone
#    def xmlschema
#      # initial code: "#{time.strftime("%Y-%m-%dT%H:%M:%S")}#{formatted_offset(true, 'Z')}"
#      "#{time.strftime("%Y-%m-%dT%H:%M:%S")}#{formatted_offset(true, nil)}"
#    end
#  end
#end

# 参考 sonar ,运行时自动升级后台表
#require File.dirname(__FILE__) + '/../lib/sonar_webservice_plugins.rb'
require File.dirname(__FILE__) + '/../lib/database_version.rb'
DatabaseVersion.automatic_setup
