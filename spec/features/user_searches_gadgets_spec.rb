require "spec_helper"

describe "Gadget management" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user, :run_callbacks => false)
    FactoryGirl.create(:gadget, user_id: @user.id, manufacturer: "Apple")
    FactoryGirl.create(:gadget, user_id: @user.id, manufacturer: "Samsung")
    FactoryGirl.create(:gadget, user_id: @user.id, manufacturer: "Sony")
  end

  it "lets user search for a specific gadget" do
    FactoryGirl.create(:gadget, name: "ipod shuffle", user_id: @user.id)

    visit gadgets_path
    page.should have_content "Search gadgets"

    page.select 'Name', :from => 'q_c_0_a_0_name'
    fill_in 'q_c_0_v_0_value', with: 'ipod'

    click_button "Search"
    page.should have_content "ipod shuffle"
  end

  it "displays a notice if no results are found" do
    visit gadgets_path

    page.select 'Manufacturer', :from => 'q_c_0_a_0_name'
    fill_in 'q_c_0_v_0_value', with: 'Microsoft'

    click_button "Search"
    page.should have_content "No results found"
  end

  it "lets the user sort gadgets by manufacturer" do
    visit gadgets_path
    click_link 'Manufacturer'
    current_gadgets = page.all('td.gadget_manufacturer').map(&:text)
    current_gadgets.first.should == 'Apple'
    current_gadgets[1].should == 'Samsung'
    current_gadgets[2].should == 'Sony'
  end

end