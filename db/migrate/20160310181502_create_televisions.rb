class CreateTelevisions < ActiveRecord::Migration
  def change
    create_table :televisions do |t|
      t.integer :user_id
      t.string :brand
      t.string :cable_company

      t.timestamps null: false
    end
  end
end
