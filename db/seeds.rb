# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create({title:"Margeritha", price:"1.23"})
Product.create({title:"Funghi", price:"3.23"})
Product.create({title:"Montanero", price:"5.54"})
Product.create({title:"Spinat", price:"9.99"})

Ingredient.create({name:"Mushrooms", quantity:"5", price:"1.11"})
Ingredient.create({name:"Spinach", quantity:"4", price:"2.11"})
Ingredient.create({name:"Fake Cheese", quantity:"12", price:"3.11"})
