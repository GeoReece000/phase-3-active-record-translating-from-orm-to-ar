require "pry"
require "active_record"
require "logger"

#Set up a database connection
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/test.sqlite3"
)

# Create a dogs table
sql = <<-SQL
 CREATE TABLE IF NOT EXISTS dogs (
  id INTEGER PRIMARY KEY,
  name TEXT
)
SQL
ActiveRecord::Base.connection.execute(sql)

# Log sql output to the terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Have Student class inherit from ActiveRecord::Base
class Dog < ActiveRecord::Base
end

binding.pry
