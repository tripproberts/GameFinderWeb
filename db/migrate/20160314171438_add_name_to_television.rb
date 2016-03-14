class AddNameToTelevision < ActiveRecord::Migration
  def change
    add_column :televisions, :name, :string
  end
end
