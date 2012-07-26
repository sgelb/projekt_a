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

require 'spec_helper'

describe Product do
  pending "add some examples to (or delete) #{__FILE__}"
end
