class Order < ActiveRecord::Base
  attr_accessible :address, :name
  has_many :line_items, dependent: :destroy

  validates :address, :name, presence: true
end
