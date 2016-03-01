class Api::LeaguesController < ApiController
  before_action :authenticate_user!

  def index
    render json: League.all
  end

  def competitors
    render json: League.find(params[:id]).competitors
  end

end
