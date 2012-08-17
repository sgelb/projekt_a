require 'spec_helper'

describe 'Authentication' do
  subject { page }

  describe "signin" do
    before { visit signin_path }
    
# FIXME: login doesn't work.
#    describe "with valid information" do
#      let(:user) { FactoryGirl.create(:user) }
#
#      before do
#        fill_in :name, with: user.name
#        fill_in :password, with: user.password
#        click_button "Sign in"
#      end
#
#      it { should have_selector('title', text:full_title("Our pizzas!")) }
#      it { should have_selector('div.alert.alert-notice', text: "Hello") }
#      it { should_not have_link('Sign in', href: signin_path) }
#      it { should have_link('Sign out', href: signout_path) }
#    end

    describe "with invalid information" do
      before { click_button "Sign in" }
      it { should have_selector('title', text:full_title("Sign in")) }
      it { should have_selector('div.alert.alert-error', text: 'Name and') }
      it { should have_link('Sign in') }
      it { should_not have_link('Sign out', href: signout_path) }
    end

  end

end
