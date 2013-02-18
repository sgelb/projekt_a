# encoding: utf-8
require 'spec_helper'

describe 'Authentication' do
  subject { page }

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Anmelden" }
      it { should have_selector('div.alert.alert-error', text: 'Name und') }
      it { should have_button('Anmelden') }
      it { should_not have_link('Abmelden', href: signout_path) }
    end
  end
end
