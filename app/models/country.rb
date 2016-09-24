class Country < ActiveRecord::Base

  has_many :states, foreign_key: 'country_name', dependent: :destroy

  self.primary_key = 'name'

  validates_presence_of :name

end
