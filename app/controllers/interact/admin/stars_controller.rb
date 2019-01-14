class Interact::Admin::StarsController < Interact::Admin::BaseController
  before_action :set_star, only: [:show, :edit, :update, :destroy]

  def index
    q_params = params.permit(:user_id, :starred_type, :starred_id)
    @stars = Star.default_where(q_params).page(params[:page])
  end

  def new
    @star = Star.new
  end

  def create
    @star = Star.new(star_params)

    if @star.save
      redirect_to admin_stars_url, notice: 'Star was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @star.update(star_params)
      redirect_to admin_stars_url, notice: 'Star was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @star.destroy
    redirect_to admin_stars_url, notice: 'Star was successfully destroyed.'
  end

  private
  def set_star
    @star = Star.find(params[:id])
  end

  def star_params
    params.fetch(:star, {}).permit(
      :user_id,
      :starred_type,
      :starred_id
    )
  end

end
