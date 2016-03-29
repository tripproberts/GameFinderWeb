class AddTelevisionIdToChannels < ActiveRecord::Migration
  def change
    add_column :user_channels, :television_id, :integer
  end
end
