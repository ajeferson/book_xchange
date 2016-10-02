class City < ActiveRecord::Base
  belongs_to :state
  has_many :neighborhoods, dependent: :destroy
  validates_presence_of :name
end
