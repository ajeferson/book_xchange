class Author < ActiveRecord::Base

  self.primary_key = 'cpf'

  validates_presence_of :name, :cpf, :birth_date

end
