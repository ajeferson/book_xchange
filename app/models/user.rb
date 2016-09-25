class User < ActiveRecord::Base

  self.primary_key = 'username'

  validates_presence_of :name, :email, :username, :password

end
