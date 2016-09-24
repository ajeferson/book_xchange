class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string :name, null: false
      t.string :kind, null: false
      t.references :neighborhood, index: true, foreign_key: true
    end
  end
end
