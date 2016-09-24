class City < ActiveRecord::Base
  belongs_to :state
  has_many :neighborhoods
  validates_presence_of :name
end
