class User::PreferencesController < ApplicationController
  before_filter :authenticate_user!

  def update
    current_user.update!(user_params)
  end

  private

  def user_params
    preferences_attrs = [:preference_type, :preference_id, :amount, :scale]
    params.require(:user).permit(preferences_attributes: preferences_attrs)
  end
end
