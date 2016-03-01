namespace :db do
  desc "populate db with leagues"
  task populate_leagues: :environment do
    require "#{Rails.root}/lib/sport_radar"
    SportRadar.sports.each do |s|
      League.create!(name: s.name)
    end
  end

  desc "populate db with competitors for each sport"
  task populate_competitors: :environment do
    require "#{Rails.root}/lib/sport_radar"
    SportRadar.sports.each do |s|
      l = League.find_by_name(s.name)
      s.competitors.each do |c|
        Competitor.create!(league: l, name: c.name)
      end
    end
  end

end
