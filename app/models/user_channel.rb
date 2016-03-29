class UserChannel < ActiveRecord::Base
  belongs_to :user
  belongs_to :television

  def as_json(options={})
    {
      channel_number: channel_number,
      channel_acronym: channel_acronym,
      television_id: television_id
    }
  end
end
