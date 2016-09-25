class Book < ActiveRecord::Base

  belongs_to :genre
  belongs_to :publisher, foreign_key: 'publisher_cnpj'
  belongs_to :author, foreign_key: 'author_cpf'

  self.primary_key = 'isbn'

  validates_presence_of :pages, :isbn, :name, :publish_date, :edition, :publisher_cnpj, :genre_id, :author_cpf

end
