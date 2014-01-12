require 'spec_helper'

describe Gadget do
  it { should belong_to(:user) }
  it { should have_many(:photos) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:quantity) }

  it "has a valid factory" do
    FactoryGirl.create(:gadget).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryGirl.build(:gadget, name: nil).should_not be_valid
  end

  it "returns a sorted array of results that match" do
    smith = FactoryGirl.create(:user)
    jones = FactoryGirl.create(:user)
    johnson = FactoryGirl.create(:user)


    gadget_one = FactoryGirl.create(:gadget, user_id: smith.id)
    gadget_two = FactoryGirl.create(:gadget, user_id: smith.id)
    gadget_three = FactoryGirl.create(:gadget, user_id: smith.id)

    Gadget.belonging_to(smith.id).should eq [gadget_one, gadget_two, gadget_three]
    Gadget.belonging_to(jones.id).should_not include gadget_one
  end

end

