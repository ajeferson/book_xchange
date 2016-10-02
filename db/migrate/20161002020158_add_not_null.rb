class AddNotNull < ActiveRecord::Migration
  def change
    change_column :books, :genre_id, :integer, null: true
  end
end
