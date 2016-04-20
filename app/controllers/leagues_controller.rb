class LeaguesController < ApplicationController
  def index
    @leagues = League.all.sort_by { |l| l.name }
  end

  def competitors
    @league = League.find(params[:id])
    @competitors = @league.competitors.sort_by { |c| c.name}
  end
end
