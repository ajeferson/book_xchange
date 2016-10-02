class Author < ActiveRecord::Base

  self.primary_key = 'cpf'

  include AuthorConcern

  validates_presence_of :name, :cpf, :birth_date
  has_many :books, dependent: :nullify, foreign_key: 'author_cpf'

end
