class Api::User::ChannelsController < ApiController
  before_filter :authenticate_user!

  def index
    render json: current_user.channels
  end

  def create
    current_user.channels.build(channel_params[:channels])
    current_user.save!
    render json: current_user.channels
  end

  private

  def channel_params
    params.permit(channels: [:channel_number, :channel_acronym, :television_id])
  end
end
