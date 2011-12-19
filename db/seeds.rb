# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Customer.create(name: "Development", domain: "localhost")
Customer.create(name: "Acme Corporation", domain: "acme.com", database: "acme.com")
Customer.create(name: "Oceanic Airlines", domain: "oceanic.com", database: "oceanic.com")


puts "\n\n--------------------------------------------------------------------------------"
puts "Add the following to your host file:"
puts "127.0.0.1 www.acme.com acme.com"
puts "127.0.0.1 www.oceanic.com oceanic.com"
puts "--------------------------------------------------------------------------------\n\n"
