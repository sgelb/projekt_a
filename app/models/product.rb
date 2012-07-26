# == Schema Information
#
# Table name: products
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  price      :decimal(7, 2)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :price, :title
  default_scope order: 'title'
  has_many :line_items

  # we don't want empty fields
  validates :title, :price, presence: true

  # price must have special format and be greater than 0
  validates :price, format: { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {greater_than: 0}

  # every product name must be unique
  validates :title, uniqueness: true
end
