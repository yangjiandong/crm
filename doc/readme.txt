fat_free_crm
==============

2010.11.08
-----------

   1. add yaml_db
   Gemfile add:
      gem 'yaml_db'

   bundle unlock
   bundle install
   bundle lock

   --dump data,default db/data.yml
   jrake db:dump 
   --load data
   jrake db:load

2010.11.07
-----------

   1. 建立branch ror.2.3.8
   git branch ror.2.3.8
   git push origin ror.2.3.8

   git co -b ror.2.3.8 origin/ror.2.3.8

   2. use rails 3.0.1 use jdbcsqlite3

   rake db:create
   rake db:migrate
   --rake crm:setup
   --Loading demo data
   rake crm:demo:load

   3. use rails3
   undefined method add_observer for Rake::Task:Class (NoMethodError)

2010.11.05
-----------

   1. install

   git clone https://github.com/michaeldv/fat_free_crm.git
   or
   download zip

   jruby -S intall rails -v=2.3.8 --no-rdoc --no-ri

   update database.yml
      jdbcmysql
      or
      jdbcsqlite3

   rake db:create
   rake crm:setup
   --Loading demo data
   rake crm:demo:load

   jruby script/server

   2. deploy to tomcat

   edit Gemfile
   bundle install --without=development test
   bundle lock
   rake war
   --数据库采用 mysql

   3. jruby on rails deploy to tomcat
   http://barefootdevelopment.blogspot.com/2007/07/jruby-on-rails-performance.html

   use jndi
   add a META-INF directory by the rails app,
   with the follow context.xml file:

<Context path="/myapp" reloadable="true" crossContext="true">
  <!-- Database Connection Pool -->
    <Resource name="jdbc/myapp"
           auth="Container"
           type="javax.sql.DataSource"
           factory="org.apache.tomcat.dbcp.dbcp.BasicDataSourceFactory"
           maxWait="1000"
           removeAbandoned="true"
           maxActive="30"
           maxIdle="10"
           removeAbandonedTimeout="60"
           logAbandoned="true"
           username="myuser"
           password="mypass"
           driverClassName="com.mysql.jdbc.Driver"
           url="jdbc:mysql://127.0.0.1:3306/myapp_development?autoReconnect=true" />
</Context>

   This is the corresponding database.yml file that tells Rails where to find the connection pool data source:
development:
  adapter: jdbc
  jndi: java:comp/env/jdbc/myapp

production:
  adapter: jdbc
  jndi: java:comp/env/jdbc/myapp

   export JAVA_OPTS="-Xms128m -Xmx512m -Djruby.objectspace.enabled=false -Djruby.jit.enabled=true"


   --END


