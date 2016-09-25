class Evaluation < ActiveRecord::Base

  belongs_to :user, foreign_key: 'user_username'
  belongs_to :book, foreign_key: 'book_isbn'

  validates_presence_of :points, :comment

  def cool_id
    "#{book_isbn}-#{user_username}"
  end

  def self.find(id)
    puts 'Valhalla'
  end

end
