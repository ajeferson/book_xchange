class Book < ActiveRecord::Base

  include BookConcern

  belongs_to :genre
  belongs_to :publisher, foreign_key: 'publisher_cnpj'
  belongs_to :author, foreign_key: 'author_cpf'
  has_many :evaluations

  self.primary_key = 'isbn'

  validates_presence_of :pages, :isbn, :name, :publish_date, :edition, :publisher_cnpj, :genre_id, :author_cpf

end
