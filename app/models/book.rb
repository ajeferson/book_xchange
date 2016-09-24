class Book < ActiveRecord::Base
  belongs_to :genre

  self.primary_key = 'isbn'

end
