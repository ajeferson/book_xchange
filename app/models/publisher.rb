class Publisher < ActiveRecord::Base

  belongs_to :address
  has_many :books, dependent: :nullify, foreign_key: 'publisher_cnpj'
end
