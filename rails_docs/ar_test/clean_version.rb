require "yaml"
require "active_record"
require "pp"

module MyModule

  include ActiveRecord
  include ActiveRecord::Tasks

  #Migrator.migrations_path='./db/migrate'
  #Schema.new.migrations_paths

  
  # pass what you need
  # db_config_file = "./config/database.yml"  
  def load_yaml(file = "./config/database.yml")
    YAML.load_file(file)    
  end

  # pass what you need
  def create_db(db_config)
    file = db_config.fetch(db_config.keys[1]).fetch('database')
    unless File.exist?(file)
      config = db_config.fetch(db_config.keys[1])
      DatabaseTasks.create(config, './')
      Base.establish_connection(config)
      Base.connection
      DatabaseTasks.structure_load(config, './', './db/structure.sql')
    end
  end

  def load_migrations(db_config)
    file = db_config.fetch(db_config.keys[1]).fetch('schema')
    config = db_config.fetch(db_config.keys[1])
    Base.establish_connection(config)    
    Base.connection
    migration_version = 0
    Migrator.run(:up, Migrator.migrations_path, migration_version) 
  end

  def dump_schema(db_config)
    file = './db/schema.rb' # db_config.fetch(db_config.keys[1]).fetch('schema')
    unless File.exist?(file)
      File.open(file, "w:utf-8") do |f|
        Base.establish_connection(db_config)
        SchemaDumper.dump(Base.connection, f)
      end
    end
  end

end  

=begin
  
  #DatabaseTasks.db_dir = './db'
  # DatabaseTasks.load_schema('./db/schema.rb') 
  # DEPRECATION WARNING: This method will act on a specific connection in the future. 
  # To act on the current connection, use `load_schema_current` instead.
  
  # DatabaseTasks.load_schema_current(db_object, './db/schema.rb', env.to_sym)
  # `resolve_symbol_connection': 'development' 
  #     database is not configured. Available: [] (ActiveRecord::AdapterNotSpecified)

  # try different migation versions
  # migration_version = 0
  # Migrator.run(:up, Migrator.migrations_path, migration_version)
  # #@sldbtask.establish_connection(config.fetch(config.keys[0]))
  # db = @sldbtask.connection

=end






$PROGRAM_NAME
if $0 == $PROGRAM_NAME
  #include MyModule
  include ActiveRecord::Tasks
  file = "./config/database.yml"
  config = YAML.load_file(file)

  # use first key in config hash
  master_key = config.keys[1]

  # get the database from the database key in config hash
  database = config.fetch(master_key).fetch('database')

  unless File.exist?(database)
    # get the hash from the first key in config hash as config data.
    @sldbtask = SQLiteDatabaseTasks.new(config.fetch(master_key), '/')
    @sldbtask.create
    @sldbtask.structure_load('./db/db_setup.sql')
  end

  system 'sqlitebrowser db/development.sqlite3'

  @sldbtask = SQLiteDatabaseTasks.new(config.fetch(master_key), '/')
  @sldbtask.establish_connection(config.fetch(master_key))

  for schema_migrations in ActiveRecord::Schema.tables.to_a

    p @modelname=schema_migrations.titleize.split.join

    p eval "class #{@modelname} < ActiveRecord::Base; self.table_name='#{schema_migrations}'; end"

  end
   
end