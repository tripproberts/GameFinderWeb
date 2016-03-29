class AddRemoteCompetitorIdToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :remote_competitor_id, :string
  end
end
