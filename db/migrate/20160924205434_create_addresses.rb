class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :number, null: false
      t.string :complement
      t.string :cep, null: false
      t.references :street, index: true, foreign_key: true
    end
  end
end
