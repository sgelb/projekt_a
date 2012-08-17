require 'spec_helper'

describe User do

    let(:user) { FactoryGirl.create(:user) }
    subject { :user }
    it { user.should respond_to(:name) }
    it { user.should respond_to(:password) }
    it { user.should respond_to(:remember_token) }
    
    it "should authenticate with correct password" do
      user.authenticate(user.password).should == user
    end

    it "should not authenticate with incorrect password" do
      user.authenticate("invalid").should be_false
    end

    it "has a valid factory" do
      FactoryGirl.create(:user).should be_valid
    end

    it "is invalid w/out name" do
      FactoryGirl.build(:user, name: nil).should_not be_valid
    end

    it "is invalid w/out password" do
      FactoryGirl.build(:user, password: nil).should_not be_valid
    end

    it "is invalid w/out password confirmation" do
      FactoryGirl.build(:user, password_confirmation: nil).should_not be_valid
    end

    it "is invalid if password too short" do
      FactoryGirl.build(:user, password: "1", 
                        password_confirmation: "1").should_not be_valid
    end

    it "is valid if password matches confirmation" do
      FactoryGirl.build(:user, password: "12345678", 
                        password_confirmation: "12345678").should be_valid
    end

    it "is invalid if password does not match confirmation" do
      FactoryGirl.build(:user, password: "12345678", 
                        password_confirmation: "12345677").should_not be_valid
    end

  end

