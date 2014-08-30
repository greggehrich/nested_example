# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Load the categories

categories = Category.create([
  { :name => 'Amusement'},
  { :name => 'Restaurant'},
  { :name => 'Bar'},
  { :name => 'Barcade'},
  { :name => 'Bowling Alley'},
  { :name => 'Skating Rink'},
  { :name => 'Laundromat'},
  { :name => 'Movie Theater'},
  { :name => 'Pool Hall'},
  { :name => 'Arcade'},
  { :name => 'Amusement Park'},
  { :name => 'Airport'},
  { :name => 'Other'}
])

# Load the states

states = State.create([
  { :name => 'Alabama', :abbreviation => 'AL'},
  { :name => 'Alaska', :abbreviation => 'AK'},
  { :name => 'Arizona', :abbreviation => 'AZ'},
  { :name => 'Arkansas', :abbreviation => 'AR'},
  { :name => 'California', :abbreviation => 'CA'},
  { :name => 'Colorado', :abbreviation => 'CO'},
  { :name => 'Connecticut', :abbreviation => 'CT'},
  { :name => 'Delaware', :abbreviation => 'DE'},
  { :name => 'District of Columbia', :abbreviation => 'DC'},
  { :name => 'Florida', :abbreviation => 'FL'},
  { :name => 'Georgia', :abbreviation => 'GA'},
  { :name => 'Hawaii', :abbreviation => 'HI'},
  { :name => 'Idaho', :abbreviation => 'ID'},
  { :name => 'Illinois', :abbreviation => 'IL'},
  { :name => 'Indiana', :abbreviation => 'IN'},
  { :name => 'Iowa', :abbreviation => 'IA'},
  { :name => 'Kansas', :abbreviation => 'KS'},
  { :name => 'Kentucky', :abbreviation => 'KY'},
  { :name => 'Louisiana', :abbreviation => 'LA'},
  { :name => 'Maine', :abbreviation => 'ME'},
  { :name => 'Maryland', :abbreviation => 'MD'},
  { :name => 'Massachusetts', :abbreviation => 'MA'},
  { :name => 'Michigan', :abbreviation => 'MI'},
  { :name => 'Minnesota', :abbreviation => 'MN'},
  { :name => 'Mississippi', :abbreviation => 'MS'},
  { :name => 'Missouri', :abbreviation => 'MO'},
  { :name => 'Montana', :abbreviation => 'MT'},
  { :name => 'Nebraska', :abbreviation => 'NE'},
  { :name => 'Nevada', :abbreviation => 'NV'},
  { :name => 'New Hampshire', :abbreviation => 'NH'},
  { :name => 'New Jersey', :abbreviation => 'NJ'},
  { :name => 'New Mexico', :abbreviation => 'NM'},
  { :name => 'New York', :abbreviation => 'NY'},
  { :name => 'North Carolina', :abbreviation => 'NC'},
  { :name => 'North Dakota', :abbreviation => 'ND'},
  { :name => 'Ohio', :abbreviation => 'OH'},
  { :name => 'Oklahoma', :abbreviation => 'OK'},
  { :name => 'Oregon', :abbreviation => 'OR'},
  { :name => 'Pennsylvania', :abbreviation => 'PA'},
  { :name => 'Rhode Island', :abbreviation => 'RI'},
  { :name => 'South Carolina', :abbreviation => 'SC'},
  { :name => 'South Dakota', :abbreviation => 'SD'},
  { :name => 'Tennessee', :abbreviation => 'TN'},
  { :name => 'Texas', :abbreviation => 'TX'},
  { :name => 'Utah', :abbreviation => 'UT'},
  { :name => 'Vermont', :abbreviation => 'VT'},
  { :name => 'Virginia', :abbreviation => 'VA'},
  { :name => 'Washington', :abbreviation => 'WA'},
  { :name => 'West Virginia', :abbreviation => 'WV'},
  { :name => 'Wisconsin', :abbreviation => 'WI'},
  { :name => 'Wyoming', :abbreviation => 'WY'}
])

# Load the games

games_data = YAML.load_file(Rails.root.join('db/seeds/games_list.yml'))

games_data.each do |game|

  manufacturer = Manufacturer.find_or_initialize_by(name: game['manufacturer'])

  manufacturer.games << Game.new(name: game['game'], description: 'A vintage arcade game.', release_date: game['year'])

  manufacturer.save

end

# Load the locations and location/game mappings

locations_data = YAML.load_file(Rails.root.join('db/seeds/locations_list.yml'))

locations_data.each { |l|

  state = State.find_by(:abbreviation => l['state'])

  location = Location.new(:name => l['location'],
                          :description => l['description'],
                          :street => l['street'],
                          :city => l['city'],
                          :state => state,
                          :zip => l['zip'],
                          :telephone => l['telephone'],
                          :url => l['url']
  )

  # Assign the location games

  games = l['games']

  games.each do |g|

    game = Game.find_by(name: g)

    arcade = Arcade.new(location: location, game: game)

    location.arcades << arcade

  end

  # Assign the location category

  category = Category.find_by(name: l['category'])
  location.category = category

  location.save

  # Sleep for a few seconds to keep the Geocoder from throwing errors due to
  # too many requests.

  sleep 5

}

# Load the 80's trivia

factoids = [
    "Everybody's favorite pellet muncher, Pac-Man, made his debut in Japan on October 22, 1980.",
    "Cabbage Patch Kids were the must-have toy of Christmas, 1983.",
    "On November 30, 1982 Michael Jackson thrilled fans around the world with the release of Thriller.",
    "In 1985 New Coke hit the market to the displeasure of sugary drink aficionados everywhere.",
    "On October 19, 1987 the U.S. stock market collapsed in what came to be known as Black Monday."
]

factoids.each do |factoid|

  Factoid.create(body: factoid)

end