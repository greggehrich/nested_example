class Admin::LocationsController < ApplicationController

  # The user must authenticate before accessing this controller
  before_filter :authenticate

  # Set the controller layout to layouts/admin.html.erb
  layout 'admin'

  #
  #
  #
  #
  def index
    @locations = Location.order('created_at desc').paginate(:page => params[:page], :per_page => 20)
  end

  def show

  end

  def new

  end

  def create

  end

  #
  #
  #
  #
  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      flash[:notice] = 'Location successfully updated.'
      redirect_to edit_admin_location_path(@location.id)
    else
      render 'edit'
    end
  end

  def destroy

  end

  private
  def location_params
    params.require(:location).permit(:name, :description, :street, :city, :state_id, :zip, :telephone, :url, :category_id, :arcades_attributes => [:id, :comment])
  end

end
