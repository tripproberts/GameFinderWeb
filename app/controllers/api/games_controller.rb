class Api::GamesController < ApiController
  before_action :authenticate_user!

  def index
    render json: current_user.games
  end
end
