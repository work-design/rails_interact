class Comment::Admin::AttitudesController < Comment::Admin::BaseController
  before_action :set_attitude, only: [:show, :edit, :update, :destroy]

  def index
    @attitudes = Attitude.page(params[:page])
  end

  def new
    @attitude = Attitude.new
  end

  def create
    @attitude = Attitude.new(attitude_params)

    if @attitude.save
      redirect_to admin_attitudes_url, notice: 'Attitude was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @attitude.update(attitude_params)
      redirect_to admin_attitudes_url, notice: 'Attitude was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attitude.destroy
    redirect_to admin_attitudes_url, notice: 'Attitude was successfully destroyed.'
  end

  private
  def set_attitude
    @attitude = Attitude.find(params[:id])
  end

  def attitude_params
    params.fetch(:attitude, {}).permit(
      :user_id,
      :opinion,
      :attitudinal_type,
      :attitudinal_id
    )
  end

end
