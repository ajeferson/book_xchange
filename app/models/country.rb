class Country < ActiveRecord::Base

  has_many :states, foreign_key: 'country_name'

  self.primary_key = 'name'

end
