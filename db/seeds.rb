# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i1 = Ingredient.create({name:"Tomatoes", quantity:"6", price:"0.81", active: 1, threshold: 5})
i2 = Ingredient.create({name:"Spinach", quantity:"4", price:"2.11", active: 0, threshold: 10})
i3 = Ingredient.create({name:"Fake Cheese", quantity:"12", price:"3.11", active: 1, threshold: 20})
i4 = Ingredient.create({name:"Mushrooms", quantity:"0", price:"1.11", active: 1, threshold: 10})

p1 = Product.new({title:"Margeritha", price:"1.23"})
p2 = Product.new({title:"Funghi", price:"3.23"})
p3 = Product.new({title:"Montanero", price:"5.54"})
p4 = Product.new({title:"Spinach", price:"9.99"})

p1.ingredients << i1
p1.ingredients << i3
p2.ingredients << i4
p3.ingredients << i3
p4.ingredients << i2
p4.ingredients << i3

p1.save
p2.save
p3.save
p4.save

u = User.create({name: "test", password: "testtest", password_confirmation: "testtest"})
