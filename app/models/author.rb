class Author < ActiveRecord::Base

  self.primary_key = 'cpf'

  include AuthorConcern

  validates_presence_of :name, :cpf, :birth_date

end
