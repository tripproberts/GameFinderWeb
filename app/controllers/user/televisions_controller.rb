class User::TelevisionsController < ApplicationController
  before_action :set_television, only: [:edit, :update, :destroy]

  def index
    @televisions = current_user.televisions
  end

  def new
    @television = current_user.televisions.build
  end

  def create
    @television = current_user.televisions.build(television_params)
    @television.save!
    redirect_to user_televisions_path, notice: "Television successfully created"
  end

  def update
    @television.update!(television_params)
    redirect_to user_televisions_path, notice: "Television successfully update"
  end

  def destroy
    @television.destroy!
    redirect_to user_televisions_path, notice: "Television successfully deleted"
  end

  private

  def set_television
    @television =  Television.find(params[:id])
  end

  def television_params
    params.require(:television).permit(:name, :brand, :cable_company)
  end

end
