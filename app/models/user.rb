class User < ActiveRecord::Base

  self.primary_key = 'username'

  include UserConcern

  has_many :evaluations, dependent: :destroy, foreign_key: 'user_username'
  has_many :exchanges_a, dependent: :nullify, foreign_key: 'user_a_username', class_name: 'Exchange'
  has_many :exchanges_b, dependent: :nullify, foreign_key: 'user_b_username', class_name: 'Exchange'
  has_many :messages_addressee, dependent: :destroy, foreign_key: 'addressee_username', class_name: 'Message'
  has_many :messages_sender, dependent: :destroy, foreign_key: 'sender_username', class_name: 'Message'

  validates_presence_of :name, :email, :username, :password

end
