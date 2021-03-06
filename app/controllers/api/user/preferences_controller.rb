class Api::User::PreferencesController < ApiController
  before_filter :authenticate_user!

  def index
    if params[:type] == "league"
      render json: current_user.preferences.where(preference_type: "League")
    elsif params[:type] == "competitor"
      render json: current_user.preferences.where(preference_type: "Competitor")
    else
      render json: current_user.preferences
    end
  end

  def update
    user_params[:preferences_attributes].each do |p|
      existing_preference = current_user.preferences.find_by(preference_type: p[:preference_type], preference_id: p[:preference_id])
      if existing_preference
        if p[:amount].to_i == 0
          existing_preference.destroy!
        else
          existing_preference.update!(amount: p[:amount], scale: p[:scale])
        end
      else
        current_user.preferences.create!(p) unless p[:amount].to_i == 0
      end
    end
    render json: current_user.preferences
  end

  private

  def user_params
    preferences_attrs = [:preference_type, :preference_id, :amount, :scale]
    params.require(:user).permit(preferences_attributes: preferences_attrs)
  end

end
