# == Schema Information
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  order_id   :integer
#

class LineItem < ActiveRecord::Base
  #attr_accessible :cart_id, :product_id

  belongs_to :order
  belongs_to :product
  belongs_to :cart
  has_and_belongs_to_many :ingredients

  attr_accessible :product

end
