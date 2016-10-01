class User < ActiveRecord::Base

  self.primary_key = 'username'

  include UserConcern

  has_many :evaluations

  validates_presence_of :name, :email, :username, :password

end
