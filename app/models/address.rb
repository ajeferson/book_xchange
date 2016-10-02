class Address < ActiveRecord::Base
  belongs_to :street
  has_many :publishers, dependent: :nullify
  validates_presence_of :number, :complement, :cep
end
