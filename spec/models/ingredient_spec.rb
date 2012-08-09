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
#

require 'spec_helper'

describe Ingredient do
  it "has a valid factory" do
    FactoryGirl.create(:ingredient).should be_valid
  end

  it "is invalid w/out name" do
    FactoryGirl.build(:ingredient, name: nil).should_not be_valid
  end

  it "is invalid w/out quantity" do
    FactoryGirl.build(:ingredient, quantity: nil).should_not be_valid
  end

  it "is invalid w/out price" do
    FactoryGirl.build(:ingredient, price: nil).should_not be_valid
  end

  it "is invalid if quantity is no integer" do
    FactoryGirl.build(:ingredient, quantity: 1.1).should_not be_valid
  end

  it "is valid if quantity is integer" do
    FactoryGirl.build(:ingredient, quantity: 2).should be_valid
  end

  it "is valid w/ quantity >= 0" do
    FactoryGirl.build(:ingredient, quantity: 1).should be_valid
  end

  it "is invalid w/ quantity < 0" do
    FactoryGirl.build(:ingredient, quantity: -1).should_not be_valid
  end

  it "is invalid with wrong price format #1 (1.124)" do
    FactoryGirl.build(:ingredient, price: 1.234).should_not be_valid
  end

  it "is invalid with wrong price format #2 (0.00)" do
    FactoryGirl.build(:ingredient, price: 0.00).should_not be_valid
  end

  it "is invalid with wrong price format #3 (1,00)" do
    FactoryGirl.build(:ingredient, price: "1,00").should_not be_valid
  end

  it "does not allow duplication of ingredient names" do
    FactoryGirl.create(:ingredient, name: "foo")
    FactoryGirl.build(:ingredient, name: "foo").should_not be_valid
  end

  it "is inactive if quantity = 0" do
    FactoryGirl.create(:ingredient, quantity: 0).active.should be_false
  end

end
