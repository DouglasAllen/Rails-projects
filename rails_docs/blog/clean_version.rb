require "yaml"
require "active_record"

include ActiveRecord
include ActiveRecord::Tasks

ActiveRecord::Migrator.migrations_path='./db/migrate'

DatabaseTasks.db_dir = './db'

db_config_file = "./config/database.yml"
db_config = YAML.load_file(db_config_file)
db_type = 'development'
db_object = db_config[db_type]

@sldbtask = SQLiteDatabaseTasks.new(db_object, './')

unless File.exist?(db_object['database'])
  @sldbtask.create
  @sldbtask.connection
  # try different migation versions
  migration_version = 20140707111715
  ActiveRecord::Migrator.run(:up, ActiveRecord::Migrator.migrations_path, migration_version)
end 

unless File.exist?('./db/schema.rb')
  File.open('./db/schema.rb', "w:utf-8") do |file|
    @sldbtask.establish_connection(db_object)
    ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
  end
end

@sldbtask.establish_connection(db_object)
db = @sldbtask.connection
p db.class
db.visitor