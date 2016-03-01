class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :preferences, class_name: "UserPreference"

  accepts_nested_attributes_for :preferences

  def games
    {test: "test"}
  end
end
