class AddNullPublishers < ActiveRecord::Migration
  def change
    change_column :books, :publisher_cnpj, :string, null: true
  end
end
