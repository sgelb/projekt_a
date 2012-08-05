class Ingredient < ActiveRecord::Base
  attr_accessible :name, :price, :quantity
end
