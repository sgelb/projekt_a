class Product < ActiveRecord::Base
  attr_accessible :price, :title
  default_scope order: 'title'

  # we don't want empty fields
  validates :title, :price, presence: true

  # price must have special format and be greater than 0
  validates :price, format: { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {greater_than: 0}

  # every product name must be unique
  validates :title, uniqueness: true
end
