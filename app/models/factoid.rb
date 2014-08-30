# The Factoid model manages the historical 80's anecdotes interspersed
# throughout the ArcadeNomad site
#
class Factoid < ActiveRecord::Base

  validates :body, presence: { message: 'A factoid requires some text'}

end
