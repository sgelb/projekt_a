# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Product.new({title:"Margherita", price:"6.00", pic_url:"pizzas/pizza15.jpg", active: 1})
p2 = Product.new({title:"Funghi", price:"7.00", pic_url:"pizzas/pizza12.jpg", active: 1})
p3 = Product.new({title:"Roma", price:"6.50", pic_url:"pizzas/pizza06.jpg", active: 1})
p4 = Product.new({title:"Napoli", price:"7.00", pic_url:"pizzas/pizza04.jpg", active: 1})
p5 = Product.new({title:"Milano", price:"7.50", pic_url:"pizzas/pizza01.jpg", active: 1})
p6 = Product.new({title:"Venezia", price:"8.00", pic_url:"pizzas/pizza05.jpg", active: 1})
p7 = Product.new({title:"Bergamo", price:"8.00", pic_url:"pizzas/pizza07.jpg", active: 1})
p8 = Product.new({title:"Quattro Formaggi", price:"9.50", pic_url:"pizzas/pizza08.jpg", active: 1})
p9 = Product.new({title:"Firenze", price:"8.00", pic_url:"pizzas/pizza03.jpg", active: 1})
p10 = Product.new({title:"Pisa", price:"8.50", pic_url:"pizzas/pizza02.jpg", active: 1})
p11 = Product.new({title:"Torino", price:"8.00", pic_url:"pizzas/pizza11.jpg", active: 1})
p12 = Product.new({title:"Palermo", price:"7.00", pic_url:"pizzas/pizza10.jpg", active: 1})
p13 = Product.new({title:"Hawaii", price:"7.50", pic_url:"pizzas/pizza13.jpg", active: 1})
p14 = Product.new({title:"Kreta", price:"8.00", pic_url:"pizzas/pizza09.jpg", active: 1})
p15 = Product.new({title:"After Burner", price:"8.00", pic_url:"pizzas/pizza14.jpg", active: 1})

i1 = Ingredient.create({name:"Tomaten", quantity:"100", price:"0.80", active: 1, threshold: 5})
i2 = Ingredient.create({name:"Käse", quantity:"100", price:"0.80", active: 1, threshold: 10})
i3 = Ingredient.create({name:"Spinat", quantity:"100", price:"0.65", active: 1, threshold: 20})
i4 = Ingredient.create({name:"Pilze", quantity:"100", price:"0.50", active: 1, threshold: 10})
i5 = Ingredient.create({name:"Paprika", quantity:"100", price:"0.5", active: 1, threshold: 10})
i6 = Ingredient.create({name:"Edelschimmelkäse", quantity:"100", price:"1.20", active: 1, threshold: 10})
i7 = Ingredient.create({name:"Rucola", quantity:"100", price:"0.30", active: 1, threshold: 10})
i8 = Ingredient.create({name:"Mais", quantity:"100", price:"0.30", active: 1, threshold: 10})
i9 = Ingredient.create({name:"Peperoni", quantity:"100", price:"0.75", active: 1, threshold: 10})
i10 = Ingredient.create({name:"Zwiebel", quantity:"100", price:"0.50", active: 1, threshold: 10})
i11 = Ingredient.create({name:"Knoblauch", quantity:"100", price:"0.50", active: 1, threshold: 10})
i12 = Ingredient.create({name:"Oliven", quantity:"100", price:"0.50", active: 1, threshold: 10})
i13 = Ingredient.create({name:"Feta", quantity:"100", price:"0.90", active: 1, threshold: 10})
i14 = Ingredient.create({name:"Kapern", quantity:"100", price:"0.50", active: 1, threshold: 10})
i15 = Ingredient.create({name:"Artischocken", quantity:"100", price:"1.20", active: 1, threshold: 10})
i16 = Ingredient.create({name:"Ananas", quantity:"100", price:"0.80", active: 1, threshold: 10})
p1.ingredients << i1 << i2
p2.ingredients << i1 << i2 << i4
p3.ingredients << i1 << i2 << i5 << i11 << i14
p4.ingredients << i1 << i2 << i11 << i12 << i15
p5.ingredients << i1 << i2 << i7 << i8 << i10
p6.ingredients << i1 << i2 << i3 << i7 << i11
p7.ingredients << i1 << i2 << i3
p8.ingredients << i1 << i2 << i6 << i13
p9.ingredients << i1 << i2 << i3 
p10.ingredients << i1 << i2 << i14
p11.ingredients << i1 << i2 << i15
p12.ingredients << i1 << i2 << i9
p13.ingredients << i1 << i2 << i16
p14.ingredients << i1 << i2 << i10 << i11 << i13
p15.ingredients << i1 << i2 << i9 << i10 << i11



p1.save
p2.save
p3.save
p4.save
p5.save
p6.save
p7.save
p8.save
p9.save
p10.save
p11.save
p12.save
p13.save
p14.save
p15.save


u = User.create({name: "test", password: "testtest", password_confirmation: "testtest"})
