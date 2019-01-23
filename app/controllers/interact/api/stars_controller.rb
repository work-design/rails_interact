class Interact::Api::StarsController < Interact::Api::BaseController
  before_action :set_star, only: [:create, :toggle, :destroy]
  before_action :require_login, only: [:create, :toggle, :destroy]

  def index
    q_params = { starred_type: 'Post' }.with_indifferent_access
    q_params.merge! params.permit(:starred_type)
    @stars = Star.default_where(q_params).page(params[:page]).per(params[:per])
  end

  def create
    if @star.save
      render json: @star.as_json(root: true), status: :created
    else
      render json: @star.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @star.persisted? && @star.destroy
      head :no_content
    end
  end

  def toggle
    if @star.new_record? && @star.save
      render json: @star, status: :created
    elsif @star.persisted? && @star.destroy
      head :no_content
    else
      render json: @star.errors, status: :unprocessable_entity
    end
  end

  private
  def set_star
    @star = Star.find_or_initialize_by(
      starred_type: params[:starred_type].classify,
      starred_id: params[:starred_id],
      user_id: current_user.id
    )
  end

end
