require 'spec_helper'

describe "Ingredients Pages" do

  subject { page }
  before { visit ingredients_path }

  describe "ingredient page" do
    it { should have_selector('h1', text:'Our ingredients') }
    it { should have_selector('title', text:full_title('Our ingredients')) }
  end
end
