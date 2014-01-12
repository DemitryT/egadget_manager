require 'spec_helper'

describe User do
  it { should have_many(:gadgets) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
end

