class UserPreference < ActiveRecord::Base
  belongs_to :preference, polymorphic: true
  belongs_to :user

  validates_presence_of :preference
  validates_presence_of :user
  validates_presence_of :amount
  validates_presence_of :scale

  validate :not_repeat_preference

  def as_json(options={})
    {
      preference_id: preference_id,
      preference_type: preference_type,
      amount: amount,
      scale: scale
    }
  end

  private

  def not_repeat_preference
    same_preferences = UserPreference.where(user_id: user_id, preference: preference)
    ok_to_create = same_preferences.count == 0 || (same_preferences.count == 1 &&  same_preferences.first == self)
    errors.add(:base, "Cannot have multiple preferences for same object") unless ok_to_create
  end
end
