class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers, id: false do |t|
      t.string :name, null: false
      t.string :cnpj, null: false
      t.references :address, index: true, foreign_key: true, null: false
    end
    # add_index :publishers, :cnpj, unique: true
    execute('ALTER TABLE publishers ADD PRIMARY KEY (cnpj);')
  end
end
