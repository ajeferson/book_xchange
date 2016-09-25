class Message < ActiveRecord::Base

  belongs_to :addressee, class_name: 'User', foreign_key: 'addressee_username'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_username'

  validates_presence_of :date, :body, :addressee_username, :sender_username

end
