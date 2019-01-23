class Interact::Api::AttitudesController < Interact::Api::BaseController
  before_action :set_attitude, only: [:like, :like_toggle, :dislike, :dislike_toggle, :cancel]
  before_action :require_login, only: [:like, :dislike, :cancel]

  def index
    @attitudes = Attitude.page(params[:page])

    render json: @attitudes
  end

  def create
    @attitude.opinion = attitude_params[:opinion]

    if @attitude.save
      render json: @attitude.as_json(root: true), status: :ok
    else
      process_errors(@attitude)
    end
  end

  def like
    @attitude.opinion = 'liked'

    if @attitude.save
      render json: @attitude.as_json(root: true), status: :created
    else
      process_errors(@attitude)
    end
  end

  def dislike
    @attitude.opinion = 'disliked'

    if @attitude.save
      render json: @attitude.as_json(root: true), status: :accepted
    else
      process_errors(@attitude)
    end
  end

  def cancel
    if @attitude.opinion == 'liked'
      @attitude.opinion = 'like_canceled'
    elsif @attitude.opinion == 'disliked'
      @attitude.opinion = 'dislike_canceled'
    end

    if @attitude.save
      render json: @attitude.as_json(root: true), status: :accepted
    else
      process_errors(@attitude)
    end
  end

  private
  def set_attitude
    @attitude = Attitude.find_or_initialize_by(
      attitudinal_type: params[:attitudinal_type].classify,
      attitudinal_id: params[:attitudinal_id],
      user_id: current_user.id
    )
  end

  def attitude_params
    params.fetch(:attitude, {}).permit(
      :opinion
    )
  end

end
