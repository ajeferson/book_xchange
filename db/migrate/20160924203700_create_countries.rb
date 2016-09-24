class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries, id: false do |t|
      t.string :name, null: false
    end
    # add_index :countries, :name, unique: true
    execute('ALTER TABLE countries ADD PRIMARY KEY (name);')
  end
end
