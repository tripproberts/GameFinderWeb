class Api::User::GamesController < ApiController
  before_filter :authenticate_user!

  def index
    render json: current_user.games
  end

end
