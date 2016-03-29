class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :preferences, class_name: "UserPreference"
  has_many :channels, class_name: "UserChannel"
  has_many :televisions

  accepts_nested_attributes_for :preferences
  accepts_nested_attributes_for :channels

  def games
    games = []
    SportRadar.todays_games.each do |s|
      competitor_1 = Competitor.find_by_remote_competitor_id(s.home["id"])
      competitor_2 = Competitor.find_by_remote_competitor_id(s.away["id"])
      league = League.find_by_remote_league_id(s.league_id)
      games << UserGame.new(
        user: self,
        competitor_1: competitor_1,
        competitor_2: competitor_2,
        network: s.broadcast["network"],
        start_time: Time.parse(s.scheduled),
        league: league
      )
    end
    games.compact.sort_by(&:score).reverse
  end

  def television
    televisions.first
  end

  def as_json(options={})
    {
      email: email
    }
  end

end
