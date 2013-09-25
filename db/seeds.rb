# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

u = User.new({ 
:name => "Admin",
:nim => "30108591",
:role => "admin",
:username => "admin",
:email => "admin@gmail.com",
:password => "admin",
:password_confirmation => "admin",
:photo => File.open("#{RAILS_ROOT}/db/data/portfolio1.JPG"),
:handphone => "085624710902"
})
u.save
puts "admin created"

u = User.create({ 
:name => "akbar",
:nim => "30108592",
:role => "user",
:username => "akbar",
:email => "akbar@gmail.com",
:password => "akbar",
:password_confirmation => "akbar",
:photo => File.open("#{RAILS_ROOT}/db/data/portfolio1.JPG"),
:handphone => "085624710902"
})
u.save
puts "user created"

Category.create({:name => "Electronics"})
Category.create({:name => "Books"})
Category.create({:name => "Furnitures"})
Category.create({:name => "Otomotifs"})
Category.create({:name => "Others"})
puts "category created"
