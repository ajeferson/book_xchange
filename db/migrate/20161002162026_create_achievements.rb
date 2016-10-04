class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.references :badge, index: true, foreign_key: true
      t.string :user_username, index: true, null: false
    end
    add_foreign_key :achievements, :users, column: :user_username, primary_key: :username
  end
end
