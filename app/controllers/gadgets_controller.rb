class GadgetsController < ApplicationController
  def index
    @all_gadgets = Gadget.where(user_id: current_user.id) if current_user
  end

  def show
    @gadget = Gadget.find(params[:id])
    redirect_to action: :index if @gadget.nil?
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.create(params[:gadget])
    flash[:notice] = 'Your gadget has been saved' if @gadget.save
    render :new
  end

  def edit
    @gadget = Gadget.find(params[:id])
  end

  def update
    @gadget = Gadget.find(params[:id])
    if @gadget.update_attributes(params[:gadget])
      redirect_to(@gadget)
    else
      render "edit"
    end
  end
end
