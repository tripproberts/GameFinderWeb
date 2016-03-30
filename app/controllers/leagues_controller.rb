class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def competitors
    @league = League.find(params[:id])
    @competitors = @league.competitors
  end
end
