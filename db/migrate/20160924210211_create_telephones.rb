class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones, id: false do |t|
      t.string :number, null: false
      t.string :publisher_cnpj, null: false, index: true
    end
    # add_index :telephones, :number, unique: true
    execute('ALTER TABLE telephones ADD PRIMARY KEY (number);')
    add_foreign_key :telephones, :publishers, column: :publisher_cnpj, primary_key: :cnpj
  end
end
