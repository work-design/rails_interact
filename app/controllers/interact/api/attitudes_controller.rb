class Interact::Api::AttitudesController < Interact::Api::BaseController
  before_action :set_attitude, only: [:show, :update, :destroy]

  def index
    @attitudes = Attitude.page(params[:page])

    render json: @attitudes
  end

  def show
    render json: @attitude
  end

  def like
    @attitude = Attitude.find_or_initialize_by(
      attitudinal_type: params[:attitudinal_type],
      attitudinal_id: params[:attitudinal_id],
      user_id: current_user.id
    )
    @attitude.opinion = 'liked'

    if @attitude.save
      render json: @attitude.as_json(root: true), status: :created
    else
      process_errors(@attitude)
    end
  end

  def dislike
    @attitude = Attitude.find_or_initialize_by(
      attitudinal_type: params[:attitudinal_type],
      attitudinal_id: params[:attitudinal_id],
      user_id: current_user.id
    )
    @attitude.opinion = 'disliked'

    if @attitude.save
      render json: @attitude.as_json(root: true), status: :accepted
    else
      process_errors(@attitude)
    end
  end

  def cancel
    @attitude = Attitude.find_or_initialize_by(
      attitudinal_type: params[:attitudinal_type],
      attitudinal_id: params[:attitudinal_id],
      user_id: current_user.id
    )
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

  def update
    if @attitude.update(attitude_params)
      render json: @attitude
    else
      render json: @attitude.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @attitude.destroy
  end

  private
  def set_attitude
    @attitude = Attitude.find(params[:id])
  end

  def attitude_params
    params.fetch(:attitude, {})
  end
end
