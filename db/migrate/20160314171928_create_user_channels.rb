class CreateUserChannels < ActiveRecord::Migration
  def change
    create_table :user_channels do |t|
      t.integer :user_id
      t.string :channel_acronym
      t.integer :channel_number

      t.timestamps null: false
    end
  end
end
