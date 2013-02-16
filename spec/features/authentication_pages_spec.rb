# encoding: utf-8
require 'spec_helper'

describe 'Authentication' do
  subject { page }

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }
      it { should have_selector('div.alert.alert-error', text: 'Name und') }
      it { should have_button('Sign in') }
      it { should have_link('Anmelden', href: signin_path) }
      it { should_not have_link('Abmelden', href: signout_path) }
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in :session_name, with: user.name
        fill_in :session_password, with: user.password
        click_button "Sign in"
      end
      # FIXME: login doesn't work.

      it { should have_selector('div.alert.alert-notice', text: "Hi #{user.name}!") }
      it { should_not have_link('Anmelden') }
      it { should_not have_button('Sign in') }
      it { should have_link('Abmelden', href: signout_path) }
    end


  end

end
