class GadgetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user
      @all_gadgets = Gadget.belonging_to(current_user.id).page(params[:page]).per_page(10).order("created_at DESC")
    end
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
    if @gadget.save
      flash[:notice] = 'Your gadget has been saved'
      redirect_to gadget_path(@gadget) if @gadget.save
    else
      render :new
    end
  end

  def edit
    @gadget = Gadget.find(params[:id])
  end

  def update
    @gadget = Gadget.find(params[:id])
    if @gadget.update_attributes(params[:gadget])
      flash[:notice] = 'Your gadget has been updated'
      redirect_to(@gadget)
    else
      render :edit
    end
  end

  def destroy
    @gadget = Gadget.find(params[:id])
    @gadget.destroy
    flash[:notice] = "Successfully deleted the gadget."
    redirect_to gadgets_path
  end
end
