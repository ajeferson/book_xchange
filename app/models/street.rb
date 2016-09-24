class Street < ActiveRecord::Base
  belongs_to :neighborhood
  validates_presence_of :name, :kind
end
