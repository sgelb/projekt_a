# encoding: utf-8
require 'spec_helper'

describe "Store Pages" do

  subject { page }
  before { visit store_path }

  describe "store page" do
    it { should have_css('h4', text:'Unser Angebot') }
    it { should have_css('title', 'Veg damit | Übersicht') }
    it { should have_css('td', text:'Firenze') }
    it { should have_button('+ Pizza') }
  end

  describe "before adding sth to cart" do
    it "cart should be empty" do
      LineItem.count.should == 0
    end
  end

  describe "after adding sth to cart" do
    it "cart should not be empty" do
      first(:button, "+ Pizza").click
      LineItem.count.should > 0
    end
  end
end
