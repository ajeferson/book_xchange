class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, id: false do |t|
      t.integer :pages, null: false
      t.string :isbn, null: false
      t.string :name, null: false
      t.date :publish_date, null: false
      t.integer :edition, null: false
      t.string :publisher_cnpj, null: false, index: true
      t.references :genre, index: true, foreign_key: true, null: false
      t.string :author_cpf, null: false, index: true
    end
    # add_index :books, :isbn, unique: true
    execute('ALTER TABLE books ADD PRIMARY KEY (isbn);')
    add_foreign_key :books, :publishers, column: :publisher_cnpj, primary_key: :cnpj
    add_foreign_key :books, :authors, column: :author_cpf, primary_key: :cpf
  end
end
