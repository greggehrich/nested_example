# The Locations class is used to add, list, and present a detailed view
# of the locations tracked within ArcadeNomad.
#
#
class LocationsController < ApplicationController

  # Retrieve a paginated array of locations, ordering the results
  # by name in ascending fashion.
  def index

    @locations = Location.order('name asc').paginate(:page => params[:page], :per_page => 20)

  end

  # Retrieve a specific location using its friendly ID slug, and additionally
  # retrieve a list of nearby locations using the specific location's coordinates.
  def show

    @location = Location.friendly.find(params[:id])

    # Retrieve all locations within 20 miles of this location
    @nearby_locations = Location.near([@location.latitude, @location.longitude], 20).where.not(id: @location.id)

  end

  # Present the form so interested users can contribute to ArcadeNomad by adding
  # a location and its arcade games
  def new

    @location = Location.new

  end

  # Add the contributor's location to the database, or present
  # the errors
  def create

    @location = Location.new(location_params)

    # Attempt to save the location
    if @location.save

      flash.now[:notice] = 'New location created.'
      redirect_to location_path(@location.id)

    else

      flash.now[:notice] = 'Could not create location.'
      render :action => 'new'

    end

  end

  # TODO: Implement edit action
  #
  def edit
  end

  # TODO: Implement update action
  #
  #
  #
  def update
  end

  # Retrieve locations in proximity to the current user
  #
  # See https://github.com/alexreisner/geocoder/issues/86 for more information
  # about various issues regarding Geocoder and Active Record.
  #
  def nearby

    params[:distance] ||= 20

    # Use the current user's IP address to retrieve the user coordinates
    @user_coordinates = Geocoder.coordinates(request.remote_ip)

    # Presume geolocation will fail
    @geocoder_success = false

    # If geolocation fails, use a default of downtown Columbus
    if @user_coordinates == [0.0, 0.0]

      # Default coordinates when can't geolocate the current user
      @user_coordinates = [39.961122, -83.000431]

    else

      @geocoder_success = true

    end

    @locations = Location.near(@user_coordinates, params[:distance]) #.paginate(:page => params[:page], :per_page => 10)

  end



  # Whitelist the desired Location attributes for use when a contributor
  # adds a location to the database
  def location_params

    params.require(:location).permit(:name, :description, :street, :city, :state_id, :zip, :telephone, :url, :category_id, :game_ids => [])

  end

end
