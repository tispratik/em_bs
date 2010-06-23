# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


User.delete_all

u1 = User.create({:username => 'admin', :email => 's.saru3@gmail.com', :password => "123456",:password_confirmation => "123456"})


u2 = User.create({:username => 'raj', :email => 'raj@gmail.com', :password => "123456",:password_confirmation => "123456"})


u3 = User.create({:username => 'rajiv', :email => 'rajiv@gmail.com', :password => "123456",:password_confirmation => "123456"})


u4 = User.create({:username => 'test_user', :email => 'test_user@gmail.com', :password => "123456",:password_confirmation => "123456"})


u5 = User.create({:username => 'test_user1', :email => 'test_user1@gmail.com', :password => "123456",:password_confirmation => "123456"})


u6 = User.create({:username => 'test_user2', :email => 'test_user2@gmail.com', :password => "123456",:password_confirmation => "123456"})


u7 = User.create({:username => 'test_user3', :email => 'test_user3@gmail.com', :password => "123456",:password_confirmation => "123456"})


Project.delete_all

p1 = Project.create({:name => 'test_project1'})

p2 = Project.create({:name => 'test_project2'})


p3 = Project.create({:name => 'test_project3'})
