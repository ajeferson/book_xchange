class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.datetime :date, null: false
      t.string :addressee_username, null: false, index: true
      t.string :sender_username, null: false, index: true
    end
    add_foreign_key :messages, :users, column: :addressee_username, primary_key: :username
    add_foreign_key :messages, :users, column: :sender_username, primary_key: :username
  end
end
