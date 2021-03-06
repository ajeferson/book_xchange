class Street < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :addresses, dependent: :destroy
  validates_presence_of :name, :kind
end
