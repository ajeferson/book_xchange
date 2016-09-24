class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.string :country_name, null: false, index: true
    end
    add_foreign_key :states, :countries, column: :country_name, primary_key: :name
  end
end
