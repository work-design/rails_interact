class Interact::Admin::CommentsController < Interact::Admin::BaseController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    q_params = {}.with_indifferent_access
    q_params.merge! params.permit(:commentable_type, :commentable_id)
    @comments = Comment.default_where(q_params).page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_url, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(
      :title,
      :content,
      :state
    )
  end

end
