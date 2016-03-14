class Api::User::TelevisionsController < ApplicationController
  before_action :set_television

  def create
    if @television.update_attributes(television_params)
      render json: current_user.televisions
    else
      render json: { errors: @television.errors }.to_json
    end
  end

  private

  def set_television
    @television = current_user.televisions.build
  end

  def television_params
    params.require(:television).permit(:brand, :cable_company, :name)
  end
end
