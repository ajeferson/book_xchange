class State < ActiveRecord::Base

  belongs_to :country, foreign_key: 'country_name'
  has_many :cities, dependent: :destroy

  validates_presence_of :name

end
