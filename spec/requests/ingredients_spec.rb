require 'spec_helper'

describe "Ingredients Pages" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

# FIXME: login doesn't work!
#  describe "ingredient page" do
#    before { visit ingredients_path }
#    it { should have_selector('h1', text:'Our ingredients') }
#    it { should have_selector('title', text:full_title('Our ingredients')) }
#  end
end
