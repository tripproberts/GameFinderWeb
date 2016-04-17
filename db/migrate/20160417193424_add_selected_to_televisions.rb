class AddSelectedToTelevisions < ActiveRecord::Migration
  def change
    add_column :televisions, :selected, :boolean
  end
end
