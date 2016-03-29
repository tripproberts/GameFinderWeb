module SportRadar

  SPORT_RADAR_KEY = ENV["SPORT_RADAR_KEY"]

  BASE_URL = "https://api.sportradar.us/"

  SPORTS = [
    {
      name: "MLB",
      schedule_url_pre: "#{BASE_URL}mlb-t5/games/",
      schedule_url_post: "/boxscore.json?api_key=#{ENV['SPORT_RADAR_MLB_KEY']}",
      hierarchy: %w(leagues divisions teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}mlb-t5/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_MLB_KEY']}",
      format: :json
    },
    {
      name: "PGA",
      hierarchy: %w(players),
      competitor_name_location: %w(first_name last_name),
      competitors_url: "#{BASE_URL}golf-t1/profiles/pga/#{Time.now.year}/players/profiles.json?api_key=#{ENV['SPORT_RADAR_GOLF_KEY']}",
      format: :json
    },
    {
      name: "NASCAR Sprint Cup Series",
      hierarchy: %w(drivers),
      competitor_name_location: %w(full_name),
      competitors_url: "#{BASE_URL}nascar-t3/sc/#{Time.now.year}/drivers/list.json?api_key=#{ENV['SPORT_RADAR_NASCAR_KEY']}",
      format: :json
    },
    {
      name: "MMA",
      hierarchy: %w(fighter),
      competitor_name_location: %w(first_name nick_name last_name),
      competitors_url: "#{BASE_URL}mma-t1/profiles.xml?api_key=#{ENV['SPORT_RADAR_MMA_KEY']}",
      format: :xml
    },
    {
      name: "NBA",
      schedule_url_pre: "#{BASE_URL}nba-t3/games/",
      schedule_url_post: "/schedule.json?api_key=#{ENV['SPORT_RADAR_NBA_KEY']}",
      hierarchy: %w(conferences divisions teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}nba-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NBA_KEY']}",
      format: :json
    },
    {
      name: "NCAA Men's Basketball",
      hierarchy: %w(divisions conferences teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}ncaamb-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NCAAMB_KEY']}",
      format: :json
    },
    {
      name: "NCAA Football",
      hierarchy: %w(conferences subdivisions teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}ncaafb-t1/teams/FBS/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NCAAF_KEY']}",
      format: :json
    },
    {
      name: "NCAA Women's Basketball",
      hierarchy: %w(divisions conferences teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}ncaawb-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NCAAWB_KEY']}",
      format: :json
    },
    {
      name: "NHL",
      schedule_url_pre: "#{BASE_URL}nhl-t3/games/",
      schedule_url_post: "/schedule.json?api_key=#{ENV['SPORT_RADAR_NHL_KEY']}",
      hierarchy: %w(conferences divisions teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}nhl-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NHL_KEY']}",
      format: :json
    },
    {
      name: "NFL",
      hierarchy: %w(conferences divisions teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}nfl-t1/teams/hierarchy.json?api_key=#{ENV['SPORT_RADAR_NFL_KEY']}",
      format: :json
    },
    {
      name: "Asian Soccer",
      hierarchy: %w(category tournament_group tournament team),
      competitor_name_location: %w(name),
      competitors_url: "#{BASE_URL}soccer-t2/as/teams/hierarchy.xml?api_key=#{ENV['SPORT_RADAR_ASIA_SOCCER_KEY']}",
      format: :xml
    },
    {
      name: "South American Soccer",
      hierarchy: %w(category tournament_group tournament team),
      competitor_name_location: %w(name),
      competitors_url: "#{BASE_URL}soccer-t2/sa/teams/hierarchy.xml?api_key=#{ENV['SPORT_RADAR_SA_SOCCER_KEY']}",
      format: :xml
    },
    {
      name: "North American Soccer",
      hierarchy: %w(category tournament_group tournament team),
      competitor_name_location: %w(name),
      competitors_url: "#{BASE_URL}soccer-t2/na/teams/hierarchy.xml?api_key=#{ENV['SPORT_RADAR_NA_SOCCER_KEY']}",
      format: :xml
    },
    {
      name: "European Soccer",
      hierarchy: %w(category tournament_group tournament team),
      competitor_name_location: %w(name),
      competitors_url: "#{BASE_URL}soccer-t2/eu/teams/hierarchy.xml?api_key=#{ENV['SPORT_RADAR_EUROPE_SOCCER_KEY']}",
      format: :xml
    },
    {
      name: "WNBA",
      hierarchy: %w(conferences teams),
      competitor_name_location: %w(market name),
      competitors_url: "#{BASE_URL}wnba-t3/league/hierarchy.json?api_key=#{ENV['SPORT_RADAR_WNBA_KEY']}",
      format: :json
    }
  ]

  def self.sports
    SportRadar::SPORTS.map { |s| SportRadar::Sport.new(s) }
  end

  def self.todays_games
    games = []
    sports.each do |s|
      games << s.games
    end
    games
  end

  class Sport

    attr_accessor :name, :schedule_url_pre, :schedule_url_post, :competitors_url, :format, :hierarchy, :competitor_name_location

    def initialize(args={})
      args.each { |n, v| send("#{n}=", v) }
    end

    def schedule_url
      "#{schedule_url_pre}#{Time.current.year}/#{Time.current.month}/#{Time.current.day}#{schedule_url_post}"
    end

    def games
      if schedule_url_pre && schedule_url_post
        uri = URI.parse(schedule_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        puts response.body
      end
    end

    def competitors
      @competitors ||= get_competitors
    end

    private

    def get_competitors
      uri = URI.parse(competitors_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      if format == :json
        json = JSON.parse response.body
        i = 0
        nodes = [json]
        while i < hierarchy.count
          newNodes = []
          for node in nodes
            newNode = if not node[hierarchy[i]].nil?
                        if node[hierarchy[i]].is_a? Array
                          node[hierarchy[i]]
                        elsif node[hierarchy[i]].is_a? Hash
                          [node[hierarchy[i]]]
                        end
                      elsif not node[hierarchy[i]].blank?
                        [node]
                      end
            newNodes += newNode if newNode
          end
          nodes = newNodes
          i += 1
        end
        nodes.map { |n| Competitor.new(name: competitor_name_location.map { |c| n[c] }.join(" ")) unless n.blank? }.compact
      elsif format == :xml
        xml = Nokogiri::HTML response.body
        xml.xpath("//#{hierarchy.last}").map { |l| Competitor.new(name: competitor_name_location.map { |c| l[c] }.join(" ")) }
      end
    end
  end

  class Competitor
    attr_accessor :name
    def initialize(args={})
      args.each { |n, v| send("#{n}=", v) }
    end
  end

end
