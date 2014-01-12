require "spec_helper"

describe "Gadget management" do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    users_iphone = FactoryGirl.create(:gadget, user_id: user.id)
  end

  it "signed in user should be able to get to the gadget management page" do
    visit gadgets_path
    page.should have_content "Manage my gadgets"
  end

  it "lets user create a new gadet" do
    visit gadgets_path
    click_button "+ Add new gadget"

    within("#new_gadget") do
      fill_in 'Name', :with => 'my old ipod'
      fill_in 'Manufacturer', :with => 'Apple'
      click_button 'Submit'
    end

    page.should have_content 'Your gadget has been saved'
    page.should have_content 'my old ipod'
    page.should have_content 'Apple'
  end

  it "lets user edit gadget details" do
    iphone = FactoryGirl.create(:gadget)

    visit edit_gadget_path(iphone)

    fill_in 'Name', :with => 'iPhone 5s'
    click_button 'Submit'

    page.should have_content 'Your gadget has been updated'
    page.should have_content 'iPhone 5s'
  end

  it "lets user delete gadget" do
    visit gadgets_path
    click_link 'Remove'

    page.should have_content 'Successfully deleted the gadget.'
    page.should have_content 'No gadgets added yet.'
  end

end