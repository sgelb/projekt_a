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
  it "has a valid factory" do
    FactoryGirl.create(:product).should be_valid
  end

  it "is invalid w/out title" do
    FactoryGirl.build(:product, title: nil).should_not be_valid
  end

  it "is invalid w/out price" do
    FactoryGirl.build(:product, price: nil).should_not be_valid
  end

  it "is invalid with wrong price format #1 (1.124)" do
    FactoryGirl.build(:product, price: 1.234).should_not be_valid
  end

  it "is invalid with wrong price format #2 (0.00)" do
    FactoryGirl.build(:product, price: 0.00).should_not be_valid
  end

  it "is invalid with wrong price format #3 (1,00)" do
    FactoryGirl.build(:product, price: "1,00").should_not be_valid
  end

  it "does not allow duplication of product titles" do
    FactoryGirl.create(:product)
    FactoryGirl.build(:product).should_not be_valid
  end
end
