class Address < ActiveRecord::Base
  belongs_to :street
  validates_presence_of :number, :complement, :cep
end
