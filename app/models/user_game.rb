class UserGame

  attr_accessor :user, :score, :competitor_1, :competitor_2, :network, :start_time, :league

  def initialize(args={})
      args.each { |n, v| send("#{n}=", v) }

      set_score
  end

  def as_json(options={})
    {
      score: score,
      competitor_1: competitor_1,
      competitor_2: competitor_2,
      network: network,
      start_time: start_time,
      league: league
    }
  end

  private

  def set_score
    score = 0
    preferences = user.preferences
    preferred_teams = preferences.map {|p| Competitor.find(p.preference_id) if p.preference_type == "Competitor"}.compact
    sport_preference = preferences.where(preference: league)
    sport_preference = sport_preference.empty? ? 0 : sport_preference[0].amount

    if preferred_teams.include? competitor_1 and preferred_teams.include? competitor_2
      @score = 100
      return
    elsif preferred_teams.include? competitor_1 or preferred_teams.include? competitor_2
      @score = 88 + 3 * sport_preference
      return
    end

    score = sport_preference * 20

    @score = score
  end

end
