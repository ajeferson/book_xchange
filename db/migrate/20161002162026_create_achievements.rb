class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.references :badge, index: true, foreign_key: true
      t.string :user_username, index: true, null: false
    end
  end
end
