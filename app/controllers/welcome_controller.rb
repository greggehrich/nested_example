class WelcomeController < ApplicationController

  # Present the ArcadeNomad home page
  def index

    # Retrieve a random arcade
    @location = Location.where(['id >= ?', rand(Location.count) + 1]).first

    # Retrieve the most recently added arcades
    @locations = Location.order('created_at desc').limit(5)

    # Retrieve the most recently added barcades
    @barcades = Location.latest_by_type('Barcade')

    # Retrieve the most popular games according to appearance frequency
    @popular_games = Game.popular.limit(5)

    # Retrieve a random fact
    @factoid = Factoid.where(['id >= ?', rand(Factoid.count) + 1]).first

  end

end
