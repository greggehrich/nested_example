#
#
#
#
#
class State < ActiveRecord::Base

  #
  # Validations
  #

  validates :name, presence: true
        
  validates :abbreviation, presence: true

  #
  # Relations
  # 

  has_many :locations

end
