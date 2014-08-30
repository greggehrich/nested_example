#
#
#
#
class Category < ActiveRecord::Base

  #
  # Validations
  # 

  validates_presence_of :name

  #
  # Relations
  #

  has_many :locations, dependent: :restrict_with_error

  #
  # Plugins
  #

  extend FriendlyId
  friendly_id :name, :use => :slugged

end
