class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors, id: false do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.date :birth_date
    end
    # add_index :authors, :cpf, unique: true
    execute('ALTER TABLE authors ADD PRIMARY KEY (cpf);')
  end
end
