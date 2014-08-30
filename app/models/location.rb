#
#
#
#
#
class Location < ActiveRecord::Base

  #
  # Validations
  #

  # A name is required and must be unique
  validates :name, presence: { message: 'The location name is required and must be unique.' }

  validates :name, uniqueness: { message: 'The location name must be unique.' }, if: "name.present?"

  # A description is required
  validates :description, presence: { message: 'A short location description is required.' }

  # A street address component is required
  validates :street, presence: { message: 'A street address is required' }

  # A city address component is required
  validates :city, presence: { message: 'A city is required.' }
  
  # A zip code is required and it must consist of exactly five digits
  validates :zip, presence: { message: 'A zip code is required' }

  with_options if: "zip.present?" do |z|
    z.validates :zip, numericality: { only_integer: true, message: 'A zip code must consist of only integers' }
    z.validates :zip, length: { is: 5, message: 'The zip code must consist of exactly five digits' }
  end

  # If provided, a telephone number must consist of exactly 10 digits. A custom setter removes
  # any non-numeric characters to save the user some frustration and unnecessary hoops.
  validates :telephone, length: { is: 10, message: 'The telephone number must consist of exactly 10 digits' }, allow_blank: true, if: "telephone.present?"

  # A state must always be associated with the location
  validates :state, presence: { message: 'A state must be assigned to the location' }

  #
  # Relations
  # 

  # Every location must be associated with a U.S. state
  belongs_to :state

  # Every location must be associated with a category
  belongs_to :category, touch: true, counter_cache: true

  # Every location is associated with one or more games
  has_many :arcades, inverse_of: :location
  has_many :games, -> { select('games.*, arcades.comment as comment').order('games.name asc') },  :through => :arcades
  accepts_nested_attributes_for :arcades

  #
  # Scopes
  #

  # Retrieve locations having a URL not set to blank or NULL
  scope :has_url, -> { where("url <> ''") }

  # Retrieve locations having a telephone number not set to blank or NULL
  scope :has_telephone, -> { where("telephone <> ''") }

  # Retrieve locations having a menu (selling food)
  scope :has_menu, -> { where('has_menu is true') }

  scope :latest_by_type, -> (category) { joins(:category).where('categories.name = ?', category) }

  #
  # Custom Getters and Setters
  #

  # Remove all non-numeric characters from the provided telephone number.
  def telephone=(value)
    unless value.nil?
      write_attribute(:telephone, value.gsub(/[^0-9]/i, ''))
    end
  end

  #
  # Callbacks
  #

  # After everything checks out, geocode the address
  before_save :geocode

  #
  # Helpers
  #

  geocoded_by :address

  #
  # Plugins
  #

  acts_as_taggable

  extend FriendlyId
  friendly_id :name, :use => :slugged

  #
  # Methods
  #

  # Concatenates the various address-related attributes together into
  # a single string.
  #
  # @return [String, false] the concatenated address or false if the
  # errors array is not empty.
  #
  def address
    return false unless self.errors.empty?
    [street, city, state.name].compact.join(', ')
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

end
