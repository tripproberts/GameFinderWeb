class User::GamesController < ApplicationController
  before_action :ensure_signed_in

  def index
    @games = current_user.games
  end

end
