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
  miration_version = '0'
  ActiveRecord::Migrator.run(:up, ActiveRecord::Migrator.migrations_path, miration_version)
end 

unless File.exist?('./db/schema.rb')
  #DatabaseTasks.check_schema_file('./db/schema.rb')
  File.open('./db/schema.rb', "w:utf-8") do |file|
    @sldbtask.establish_connection(db_object)
    ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
  end
end

@sldbtask.establish_connection(db_object)
p db = @sldbtask.connection

@sldbtask.methods.sort - Object.methods
#@sldbtask.connection.methods.sort - Object.methods
#@sldbtask.connection._run_checkout_callbacks  
#DatabaseTasks.database_configuration = YAML.load_file(db_config_file)
#DatabaseTasks.create_current('developement')
 
#@db:schema:load
#@sldbtask.structure_load('./db/schema.rb')
#(@db.methods - Object.methods).sort.each {|elements| puts elements}
#(@db.connections.methods - Object.methods).sort.each {|elements| puts elements}

#@conn = @db.connection

#(@conn.methods - Object.methods).sort.each {|elements| puts elements}

#ActiveRecord::Tasks::DatabaseTasks.structure_load
ActiveRecord::Schema.methods(false)
ActiveRecord::SchemaMigration.methods(false)
ActiveRecord::Migration.methods(false)
ActiveRecord::Migrator.methods(false)
ActiveRecord::ModelSchema.methods(false)


#ActiveRecord::Tasks::DatabaseTasks.migrate
#ActiveRecord::Tasks.constants.sort.each {|elements| puts elements}
#ActiveRecord.constants.sort.each {|elements| puts elements}
#(ActiveRecordError.methods - Object.methods).sort.each {|elements| puts elements}