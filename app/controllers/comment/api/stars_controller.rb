class Comment::Api::StarsController < Comment::Api::BaseController

  def index
    q_params = { starred_type: 'Post' }.with_indifferent_access
    q_params.merge! params.permit(:starred_type)
    @stars = Star.default_where(q_params).page(params[:page]).per(params[:per])
  end

  def create
    @star = Star.find_or_initialize_by(
      starred_type: params[:starred_type],
      starred_id: params[:starred_id],
      user_id: current_user.id
    )

    if @star.save
      render json: @star, status: :created
    else
      render json: @star.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @star = Star.find_by(
      starred_type: params[:starred_type],
      starred_id: params[:starred_id],
      user_id: current_user.id
    )
    if @star&.destroy
      head :no_content
    end
  end

end
