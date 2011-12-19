namespace :db do
  namespace :customer do
    task :create => ["db:create", "db:migrate", :environment] do
      customers = Customer.find(:all)
      customers.each do |customer|
        begin
          next if customer.database.nil?
          puts "running: mysqladmin create #{customer.database}"
          `mysqladmin create #{customer.database}`
        rescue
        end
      end
    end

    task :drop => [:environment] do
      customers = Customer.find(:all)
      customers.each do |customer|
        begin
          next if customer.database.nil?
          puts "running: mysqladmin drop -f #{customer.database}"
          `mysqladmin drop -f #{customer.database}`
        rescue
        end
      end
    end

    task :migrate => ["db:migrate", :environment] do
      customers = Customer.find(:all)
      customers.each do |customer|
        puts "Migrating #{customer.database}"
        spec = Customer.configurations[Rails.env].clone
        spec["database"] = customer.database unless customer.database.nil?
        ActiveRecord::Base.connection.disconnect!
        ActiveRecord::Base.establish_connection(spec)
        ActiveRecord::Migrator.migrate("db/migrate", nil)
        ActiveRecord::Base.establish_connection(Customer.configurations[Rails.env])
      end
    end
  end

end

