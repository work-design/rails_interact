class Interact::My::CommentsController < Interact::My::BaseController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.page(params[:page])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to my_comments_url, notice: 'Comment was successfully created.' }
      else
        format.js
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to my_comments_url, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to my_comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(
      :title,
      :content,
      :score
    ).merge(
      params.permit(:commentable_type, :commentable_id)
    ).merge(user_id: current_user.id)
  end

end
