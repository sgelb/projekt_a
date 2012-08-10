# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Order < ActiveRecord::Base
  attr_accessible :address, :name
  has_many :line_items, dependent: :destroy

  validates :address, :name, presence: true
end
