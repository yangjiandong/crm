fat_free_crm
==============

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


   --END


