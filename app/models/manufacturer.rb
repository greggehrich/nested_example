#
#
#
#
#
class Manufacturer < ActiveRecord::Base

  #
  # Validations
  #

  validates :name, presence: true, uniqueness: true

  validates :games, presence: { message: 'Every manufacturer must be associated with at least one game.' }

  #
  # Relations
  #

  has_many :games



end
