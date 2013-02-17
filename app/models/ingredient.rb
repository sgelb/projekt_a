# == Schema Information
#
# Table name: ingredients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  quantity   :integer
#  price      :decimal(8, 2)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  active     :boolean
#  threshold  :integer
#

class Ingredient < ActiveRecord::Base
  default_scope order: 'name'
  attr_accessible :name, :price, :quantity, :active, :threshold
  has_and_belongs_to_many :products
  has_and_belongs_to_many :line_items
  
  before_save :set_active_field

  # we don't want empty fields
  validates :name, :quantity, :price, :threshold, presence: true

  # quantity has to be integer
  validates :quantity, numericality: { only_integer: true }

  # quantity can not be lesser than zero
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  
  # threshold has to be integer
  validates :threshold, numericality: { only_integer: true }

  # threshold can not be lesser than zero
  validates :threshold, numericality: { greater_than_or_equal_to: 0 }

  # price must have special format and be greater than 0
  validates :price, format: { :with => /^\d+??(?:\.\d{0,2})?$/ }, numericality: {greater_than: 0}

  # every product name must be unique
  validates :name, uniqueness: true

  def set_active_field
    if self.quantity.zero?
      self.active = 0
    end
  end
end
