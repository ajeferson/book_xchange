class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :username, null: false
      t.string :password, null: false
      t.date :birth_date
    end
    # add_index :users, :username, unique: true
    execute('ALTER TABLE users ADD PRIMARY KEY (username);')
  end
end
