class NotNullAuthors < ActiveRecord::Migration
  def change
    change_column :books, :author_cpf, :string, null: true
  end
end
