class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations, id: false do |t|
      t.integer :points, null: false
      t.string :comment
      t.string :user_username, null: false, primary: true
      t.string :book_isbn, null: false, primary: true
    end

    # add_index :evaluations, [:user_username, :book_isbn], unique: true

    execute('ALTER TABLE evaluations ADD PRIMARY KEY (user_username,book_isbn);')

    add_foreign_key :evaluations, :users, column: :user_username, primary_key: :username
    add_foreign_key :evaluations, :books, column: :book_isbn, primary_key: :isbn

  end
end
