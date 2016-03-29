class Competitor < ActiveRecord::Base

  belongs_to :league

  attr_accessor :wins, :losses

  def as_json(options={})
    {
      id: id,
      league_id: league_id,
      name: name
    }
  end
end
