class SportRadar

  SPORT_RADAR_KEY = ENV["SPORT_RADAR_KEY"]

  BASE_URL = "https://api.sportradar.us/"

  SPORTS = {
    cricket: {
      string: "Cricket",
      teams: "#{BASE_URL}cricket-t1/teams/hierarchy.json?api_key=#{ENV['SPORT_RADAR_CRICKET_KEY']}"
    },
    mlb: {
      string: "MLB",
      teams: "#{BASE_URL}mlb-t5/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_MLB_KEY']}"
    },
    golf: {
      string: "PGA",
      golfers: "#{BASE_URL}golf-t1/profiles/pga/#{Time.now.year}/players/profiles.json?api_key=#{ENV['SPORT_RADAR_GOLF_KEY']}"
    },
    nascar: {
      string: "NASCAR Sprint Cup Series",
      drivers: "#{BASE_URL}nascar-t3/sc/#{Time.now.year}/drivers/list.json?api_key=#{ENV['SPORT_RADAR_NASCAR_KEY']}"
    },
    mma: {
      string: "MMA",
      fighters: "#{BASE_URL}mma-t1/profiles.json?api_key=#{ENV['SPORT_RADAR_MMA_KEY']}"
    },
    nba: {
      string: "NBA",
      teams: "#{BASE_URL}nba-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NBA_KEY']}"
    },
    ncaamb: {
      string: "NCAA Men's Basketball",
      teams: "#{BASE_URL}ncaamb-t3/teams/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NCAAMB_KEY']}"
    },
    ncaaf: {
      string: "NCAA Football",
      teams: "#{BASE_URL}ncaafb-t1/teams/FBS/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NCAAF_KEY']}"
    },
    ncaawb: {
      string: "NCAA Women's Basketball",
      teams: "#{BASE_URL}ncaawb-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NCAAWB_KEY']}"
    },
    rugby: {
      string: "Rugby",
      teams: "#{BASE_URL}rugby-t1/teams/#{Time.now.year}/hierarchy.json?api_key=#{ENV['SPORT_RADAR_RUGBY_KEY']}"
    },
    nhl: {
      string: "NHL",
      teams: "#{BASE_URL}nhl-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NHL_KEY']}"
    },
    nfl: {
      string: "NFL",
      teams: "#{BASE_URL}nfl-t1/teams/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NFL_KEY']}"
    },
    as_soccer: {
      string: "Asian Soccer",
      teams: "#{BASE_URL}soccer-t2/as/teams/hierarchy.json?api_key=#{ENV['SPORT_RADAR_ASIA_SOCCER_KEY']}"
    },
    sa_soccer: {
      string: "South American Soccer",
      teams: "#{BASE_URL}soccer-t2/sa/teams/hierarchy.json?api_key=#{ENV['SPORT_RADAR_SA_SOCCER_KEY']}"
    },
    na_soccer: {
      string: "North American Soccer",
      teams: "#{BASE_URL}soccer-t2/na/teams/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NA_SOCCER_KEY']}"
    },
    eu_soccer: {
      string: "European Soccer",
      teams: "#{BASE_URL}soccer-t2/eu/teams/hierarchy.json?api_key=#{ENV['SPORT_RADAR_EUROPE_SOCCER_KEY']}"
    },
    wnba: {
      string: "WNBA",
      teams: "#{BASE_URL}wnba-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_WNBA_KEY']}"
    }
  }

end
