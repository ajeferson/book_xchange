class NullExchangesUser < ActiveRecord::Migration
  def change
    change_column :exchanges, :user_a_username, :string, null: true
    change_column :exchanges, :user_b_username, :string, null: true
  end
end
