fat_free_crm
==============

2010.11.10
----------

   1. log

      logback.xml
  <root>
    <level value="ERROR"/>
    <appender-ref ref="STDOUT"/>
  </root>

      --rails 采用logback
      --development.rb
      config.logger = Slf4jLogger.new
      ActiveRecord::Base.logger = config.logger

      --web.xml,不知有什么作用
    <env-entry>
        <description>JNDI logback context</description>
        <env-entry-name>logback/context-name</env-entry-name>
        <env-entry-type>java.lang.String</env-entry-type>
        <env-entry-value>dev</env-entry-value>
    </env-entry>

2010.11.09
----------

   1. jruby-rack 暂时用1.0.1, 1.0.3 有bug,jetty下不能显示,首页为浏览目录.
      mysql jdbc 只能用5.0.4, 采用5.1.13 报
      ActiveRecord::JDBCError: Generated keys not requested. You need to
      specify Statement.RETURN_GENERATED_KEYS to Statement.executeUpdate()
      or Connection.prepareStatement().: SET SQL_AUTO_IS_NULL=0

   2. webapp/WEB-INF/gems 不加入版本

   3、手工建立eclipse项目

   a、建立m2_home变量
     mvn -Declipse.workspace=<path-to-eclipse-workspace> eclipse:add-maven-repo
   b、生成eclipse项目
     mvn eclipse:eclipse
     bin/eclipse.bat

   4. 生成演示数据
   --yaml_db 在rails2.3 中有点问题,具体看jrails/doc/readme.txt

   拷贝yaml_db到lib下
   rake db:dump --> db/data.yml

   --load data
   rake db:data:load <-- db/data.yml

2010.11.08
-----------

   1. plugin haml
   http://haml-lang.com/docs/yardoc/file.HAML_REFERENCE.html

   2. 建立branch mvn.ror.2.3.8
   git branch mvn.ror.2.3.8
   git push origin mvn.ror.2.3.8

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


