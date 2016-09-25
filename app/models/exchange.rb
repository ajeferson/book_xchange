class Exchange < ActiveRecord::Base

  belongs_to :user_a, class_name: 'User', foreign_key: 'user_a_username'
  belongs_to :user_b, class_name: 'User', foreign_key: 'user_b_username'
  belongs_to :book_a, class_name: 'Book', foreign_key: 'book_a_isbn'
  belongs_to :book_b, class_name: 'Book', foreign_key: 'book_b_isbn'

  validates_presence_of :user_a_username, :user_b_username, :book_a_isbn, :book_b_isbn

end
