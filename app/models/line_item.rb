# == Schema Information
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class LineItem < ActiveRecord::Base
  #attr_accessible :cart_id, :product_id

  belongs_to :product
  belongs_to :cart

end
