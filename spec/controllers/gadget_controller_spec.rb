require 'spec_helper'

describe GadgetsController do
  before(:each) do
    sign_in FactoryGirl.create(:user)
  end

  it "renders the :index view" do
    get :index
    response.should render_template :index
  end

  describe 'DELETE destroy' do
    before(:each) do
      controller.class.skip_before_filter :authenticate_user!
      @gadget = FactoryGirl.create(:gadget)
    end

    it "deletes the gadget" do
      expect{ delete :destroy, id: @gadget }.to change(Gadget, :count).by(-1)
    end

    it "redirects to contacts#index" do
      delete :destroy, id: @gadget
      response.should redirect_to gadgets_path
    end
  end

end
