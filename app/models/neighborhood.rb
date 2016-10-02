class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :streets, dependent: :destroy
  validates_presence_of :name
end
