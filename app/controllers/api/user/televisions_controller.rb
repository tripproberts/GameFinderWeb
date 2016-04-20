class Api::User::TelevisionsController < ApplicationController
  before_action :set_television

  def index
    render json: current_user.televisions.where.not(id: nil)
  end

  def create
    if @television.update_attributes(television_params)
      render json: current_user.televisions
    else
      render json: { errors: @television.errors }.to_json
    end
  end

  def update
    Television.find(params[:id]).update!(television_params)
    render json: current_user.televisions.where.not(id: nil)
  end

  def destroy
    Television.find(params[:id]).destroy!
    render json: current_user.televisions.where.not(id: nil)
  end

  private

  def set_television
    @television = current_user.televisions.build
  end

  def television_params
    params.require(:television).permit(:brand, :cable_company, :name, :selected)
  end
end
