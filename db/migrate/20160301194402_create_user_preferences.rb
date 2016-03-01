class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.integer :preference_id
      t.string :preference_type
      t.integer :amount
      t.integer :scale
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
