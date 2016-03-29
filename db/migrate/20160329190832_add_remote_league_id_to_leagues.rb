class AddRemoteLeagueIdToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :remote_league_id, :string
  end
end
