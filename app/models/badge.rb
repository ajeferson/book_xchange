class Badge < ActiveRecord::Base
  has_many :achievements, dependent: :destroy
end
