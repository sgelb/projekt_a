require 'spec_helper'

describe "Store Pages" do

  subject { page }
  before { visit store_path }

  describe "store page" do
    it { should have_selector('h1', text:'Our pizzas!') }
    it { should have_selector('title', text:full_title('Our pizzas!')) }
    it { should have_selector('b', text:'Funghi') }
  end

  describe "before adding sth to cart" do
    it "should cart be empty" do
      LineItem.count.should == 0
    end
  end

  describe "add to cart" do
    it "should add line item" do
      expect { click_button "Add to cart" }.to change(LineItem, :count).by(1)
    end
  end
end
