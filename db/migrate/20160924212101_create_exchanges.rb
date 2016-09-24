class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.date :date, null: false
      t.string :user_a_username, null: false, index: true
      t.string :user_b_username, null: false, index: true
      t.string :book_a_isbn, null: false, index: true
      t.string :book_b_isbn, null: false, index: true
    end
    add_foreign_key :exchanges, :users, column: :user_a_username, primary_key: :username
    add_foreign_key :exchanges, :users, column: :user_b_username, primary_key: :username
    add_foreign_key :exchanges, :books, column: :book_a_isbn, primary_key: :isbn
    add_foreign_key :exchanges, :books, column: :book_b_isbn, primary_key: :isbn
  end
end
