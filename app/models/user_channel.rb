class UserChannel < ActiveRecord::Base
  belongs_to :user

  def as_json(options={})
    {
      channel_number: channel_number,
      channel_acronym: channel_acronym
    }
  end
end
