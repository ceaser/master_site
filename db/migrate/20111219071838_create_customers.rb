class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, :subdomain, :domain, :database, :socket, :host
      t.timestamps
    end
  end
end
