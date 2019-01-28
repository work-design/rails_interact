class Interact::Api::CommentsController < Interact::Api::BaseController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :require_login, only: [:create]

  def index
    q_params = {}.with_indifferent_access
    q_params.merge! params.permit(:commentable_type, :commentable_id)
    @comments = Comment.default_where(q_params).page(params[:page]).per(params[:per])
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render :show, status: :created
    else
      process_errors(@comment)
    end
  end

  def update
    if @comment.update(comment_params)
      render 'show'
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(
      :title,
      :content,
      :star_count,
    ).merge(
      commentable_type: params[:commentable_type].classify,
      commentable_id: params[:commentable_id]
    ).merge(user_id: current_user.id)
  end

  def growth_entity_type
    params[:commentable_type]
  end

  def growth_entity_id
    params[:commentable_id]
  end

end
