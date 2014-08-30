
namespace :utilities do

  # Delete all rows in the database except for that found in the schema_migrations table
  # and reset the auto-increment counters.
  #
  #
  desc 'Clear database'
  task :clear_db => :environment do |t, args|

    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection.tables.each do |table|

      next if table == 'schema_migrations'

      # MySQL / PostgreSQL
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

      # SQLite
      # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")

    end

  end

end