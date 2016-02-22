class GamesController < ApplicationController
  before_filter :check_signed_in

  private

  def check_signed_in
    redirect_to new_user_session_path unless current_user
  end

end
