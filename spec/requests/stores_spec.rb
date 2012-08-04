require 'spec_helper'

describe "Store Pages" do

  subject { page }
  before { visit store_path }

  describe "store page" do
    it { should have_selector('h1', text:'Our pizzas!') }
    it { should have_selector('title', text:full_title('Our pizzas!')) }
    it { should have_selector('td', text:'Funghi') }
    it { should have_button('Add to cart') }
  end

  describe "before adding sth to cart" do
    it "cart should be empty" do
      LineItem.count.should == 0
    end
  end

  describe "after adding sth to cart" do
    it "cart should not be empty" do
      click_button "Add to cart"
      LineItem.count.should > 0
    end
  end
end
