class State < ActiveRecord::Base

  belongs_to :country, foreign_key: 'country_name'

end
