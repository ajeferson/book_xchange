class NullAddresses < ActiveRecord::Migration
  def change
    change_column :publishers, :address_id, :integer, null: true
  end
end
